Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Message-ID: <AMoAtwB9DXJsyd-1khUpzqq9.1.1595862196133.Hmail.wenhu.wang@vivo.com>
Subject: =?UTF-8?B?W1BBVENIXSBzb2M6IHFtaTogYWxsb3cgdXNlciB0byBzZXQgaGFuZGxlIHdxIHRvIGhpcHJpbw==?=
MIME-Version: 1.0
From: =?UTF-8?B?546L5paH6JmO?= <wenhu.wang@vivo.com>
Date: Mon, 27 Jul 2020 23:03:16 +0800 (GMT+08:00)
List-Id: <ath11k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+kvalo=adurom.com@lists.infradead.org
To: elder@kernel.org, davem@davemloft.net, kuba@kernel.org, kvalo@codeaurora.org, agross@kernel.org, bjorn.andersson@linaro.org, ohad@wizery.com, linux-kernel@vger.kernel.org
Cc: linux-wireless@vger.kernel.org, alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, ath10k@lists.infradead.org, srinivas.kandagatla@linaro.org, sibis@codeaurora.org, netdev@vger.kernel.org, wenhu.wang@vivo.com, ath11k@lists.infradead.org

Currently the qmi_handle is initialized single threaded and strictly
ordered with the active set to 1. This is pretty simple and safe but
sometimes ineffency. So it is better to allow user to decide whether
a high priority workqueue should be used.

Signed-off-by: Wang Wenhu <wenhu.wang@vivo.com>
---
 drivers/net/ipa/ipa_qmi.c             | 4 ++--
 drivers/net/wireless/ath/ath10k/qmi.c | 2 +-
 drivers/net/wireless/ath/ath11k/qmi.c | 2 +-
 drivers/remoteproc/qcom_sysmon.c      | 2 +-
 drivers/slimbus/qcom-ngd-ctrl.c       | 4 ++--
 drivers/soc/qcom/pdr_interface.c      | 4 ++--
 drivers/soc/qcom/qmi_interface.c      | 9 +++++++--
 include/linux/soc/qcom/qmi.h          | 3 ++-
 samples/qmi/qmi_sample_client.c       | 4 ++--
 9 files changed, 20 insertions(+), 14 deletions(-)

diff --git a/drivers/net/ipa/ipa_qmi.c b/drivers/net/ipa/ipa_qmi.c
index 5090f0f923ad..d78b0fe6bd83 100644
--- a/drivers/net/ipa/ipa_qmi.c
+++ b/drivers/net/ipa/ipa_qmi.c
@@ -486,7 +486,7 @@ int ipa_qmi_setup(struct ipa *ipa)
 	 */
 	ret = qmi_handle_init(&ipa_qmi->server_handle,
 			      IPA_QMI_SERVER_MAX_RCV_SZ, &ipa_server_ops,
-			      ipa_server_msg_handlers);
+			      ipa_server_msg_handlers, 0);
 	if (ret)
 		return ret;
 
@@ -500,7 +500,7 @@ int ipa_qmi_setup(struct ipa *ipa)
 	 */
 	ret = qmi_handle_init(&ipa_qmi->client_handle,
 			      IPA_QMI_CLIENT_MAX_RCV_SZ, &ipa_client_ops,
-			      ipa_client_msg_handlers);
+			      ipa_client_msg_handlers, 0);
 	if (ret)
 		goto err_server_handle_release;
 
diff --git a/drivers/net/wireless/ath/ath10k/qmi.c b/drivers/net/wireless/ath/ath10k/qmi.c
index 5468a41e928e..02881882b4d9 100644
--- a/drivers/net/wireless/ath/ath10k/qmi.c
+++ b/drivers/net/wireless/ath/ath10k/qmi.c
@@ -1034,7 +1034,7 @@ int ath10k_qmi_init(struct ath10k *ar, u32 msa_size)
 
 	ret = qmi_handle_init(&qmi->qmi_hdl,
 			      WLFW_BDF_DOWNLOAD_REQ_MSG_V01_MAX_MSG_LEN,
-			      &ath10k_qmi_ops, qmi_msg_handler);
+			      &ath10k_qmi_ops, qmi_msg_handler, 0);
 	if (ret)
 		goto err;
 
diff --git a/drivers/net/wireless/ath/ath11k/qmi.c b/drivers/net/wireless/ath/ath11k/qmi.c
index c00a99ad8dbc..91394d58d36e 100644
--- a/drivers/net/wireless/ath/ath11k/qmi.c
+++ b/drivers/net/wireless/ath/ath11k/qmi.c
@@ -2397,7 +2397,7 @@ int ath11k_qmi_init_service(struct ath11k_base *ab)
 
 	ab->qmi.target_mem_mode = ATH11K_QMI_TARGET_MEM_MODE_DEFAULT;
 	ret = qmi_handle_init(&ab->qmi.handle, ATH11K_QMI_RESP_LEN_MAX,
-			      &ath11k_qmi_ops, ath11k_qmi_msg_handlers);
+			      &ath11k_qmi_ops, ath11k_qmi_msg_handlers, 0);
 	if (ret < 0) {
 		ath11k_warn(ab, "failed to initialize qmi handle\n");
 		return ret;
diff --git a/drivers/remoteproc/qcom_sysmon.c b/drivers/remoteproc/qcom_sysmon.c
index 8d8996d714f0..4ec470e424ef 100644
--- a/drivers/remoteproc/qcom_sysmon.c
+++ b/drivers/remoteproc/qcom_sysmon.c
@@ -614,7 +614,7 @@ struct qcom_sysmon *qcom_add_sysmon_subdev(struct rproc *rproc,
 	}
 
 	ret = qmi_handle_init(&sysmon->qmi, SSCTL_MAX_MSG_LEN, &ssctl_ops,
-			      qmi_indication_handler);
+			      qmi_indication_handler, 0);
 	if (ret < 0) {
 		dev_err(sysmon->dev, "failed to initialize qmi handle\n");
 		kfree(sysmon);
diff --git a/drivers/slimbus/qcom-ngd-ctrl.c b/drivers/slimbus/qcom-ngd-ctrl.c
index 743ee7b4e63f..ba76691fc5a5 100644
--- a/drivers/slimbus/qcom-ngd-ctrl.c
+++ b/drivers/slimbus/qcom-ngd-ctrl.c
@@ -446,7 +446,7 @@ static int qcom_slim_qmi_init(struct qcom_slim_ngd_ctrl *ctrl,
 		return -ENOMEM;
 
 	rc = qmi_handle_init(handle, SLIMBUS_QMI_POWER_REQ_MAX_MSG_LEN,
-				NULL, qcom_slim_qmi_msg_handlers);
+				NULL, qcom_slim_qmi_msg_handlers, 0);
 	if (rc < 0) {
 		dev_err(ctrl->dev, "QMI client init failed: %d\n", rc);
 		goto qmi_handle_init_failed;
@@ -1293,7 +1293,7 @@ static int qcom_slim_ngd_qmi_svc_event_init(struct qcom_slim_ngd_ctrl *ctrl)
 	int ret;
 
 	ret = qmi_handle_init(&qmi->svc_event_hdl, 0,
-				&qcom_slim_ngd_qmi_svc_event_ops, NULL);
+				&qcom_slim_ngd_qmi_svc_event_ops, NULL, 0);
 	if (ret < 0) {
 		dev_err(ctrl->dev, "qmi_handle_init failed: %d\n", ret);
 		return ret;
diff --git a/drivers/soc/qcom/pdr_interface.c b/drivers/soc/qcom/pdr_interface.c
index bdcf16f88a97..cc1cb90c1968 100644
--- a/drivers/soc/qcom/pdr_interface.c
+++ b/drivers/soc/qcom/pdr_interface.c
@@ -685,7 +685,7 @@ struct pdr_handle *pdr_handle_alloc(void (*status)(int state,
 
 	ret = qmi_handle_init(&pdr->locator_hdl,
 			      SERVREG_GET_DOMAIN_LIST_RESP_MAX_LEN,
-			      &pdr_locator_ops, NULL);
+			      &pdr_locator_ops, NULL, 0);
 	if (ret < 0)
 		goto destroy_indack;
 
@@ -696,7 +696,7 @@ struct pdr_handle *pdr_handle_alloc(void (*status)(int state,
 	ret = qmi_handle_init(&pdr->notifier_hdl,
 			      SERVREG_STATE_UPDATED_IND_MAX_LEN,
 			      &pdr_notifier_ops,
-			      qmi_indication_handler);
+			      qmi_indication_handler, 0);
 	if (ret < 0)
 		goto release_qmi_handle;
 
diff --git a/drivers/soc/qcom/qmi_interface.c b/drivers/soc/qcom/qmi_interface.c
index 1a03eaa38c46..01160dbfc4d0 100644
--- a/drivers/soc/qcom/qmi_interface.c
+++ b/drivers/soc/qcom/qmi_interface.c
@@ -609,6 +609,7 @@ static struct socket *qmi_sock_create(struct qmi_handle *qmi,
  * @recv_buf_size: maximum size of incoming message
  * @ops:	reference to callbacks for QRTR notifications
  * @handlers:	NULL-terminated list of QMI message handlers
+ * @hiprio:	whether high priority worker is used for workqueue
  *
  * This initializes the QMI client handle to allow sending and receiving QMI
  * messages. As messages are received the appropriate handler will be invoked.
@@ -617,9 +618,11 @@ static struct socket *qmi_sock_create(struct qmi_handle *qmi,
  */
 int qmi_handle_init(struct qmi_handle *qmi, size_t recv_buf_size,
 		    const struct qmi_ops *ops,
-		    const struct qmi_msg_handler *handlers)
+		    const struct qmi_msg_handler *handlers,
+		    unsigned int hiprio)
 {
 	int ret;
+	unsigned int flags = WQ_UNBOUND;
 
 	mutex_init(&qmi->txn_lock);
 	mutex_init(&qmi->sock_lock);
@@ -647,7 +650,9 @@ int qmi_handle_init(struct qmi_handle *qmi, size_t recv_buf_size,
 	if (!qmi->recv_buf)
 		return -ENOMEM;
 
-	qmi->wq = alloc_workqueue("qmi_msg_handler", WQ_UNBOUND, 1);
+	if (hiprio)
+		flags |= WQ_HIGHPRI;
+	qmi->wq = alloc_workqueue("qmi_msg_handler", flags, 1);
 	if (!qmi->wq) {
 		ret = -ENOMEM;
 		goto err_free_recv_buf;
diff --git a/include/linux/soc/qcom/qmi.h b/include/linux/soc/qcom/qmi.h
index e712f94b89fc..24062fd7163d 100644
--- a/include/linux/soc/qcom/qmi.h
+++ b/include/linux/soc/qcom/qmi.h
@@ -244,7 +244,8 @@ int qmi_add_server(struct qmi_handle *qmi, unsigned int service,
 
 int qmi_handle_init(struct qmi_handle *qmi, size_t max_msg_len,
 		    const struct qmi_ops *ops,
-		    const struct qmi_msg_handler *handlers);
+		    const struct qmi_msg_handler *handlers,
+		    unsigned int hiprio);
 void qmi_handle_release(struct qmi_handle *qmi);
 
 ssize_t qmi_send_request(struct qmi_handle *qmi, struct sockaddr_qrtr *sq,
diff --git a/samples/qmi/qmi_sample_client.c b/samples/qmi/qmi_sample_client.c
index c9e7276c3d83..a91d1633ea38 100644
--- a/samples/qmi/qmi_sample_client.c
+++ b/samples/qmi/qmi_sample_client.c
@@ -463,7 +463,7 @@ static int qmi_sample_probe(struct platform_device *pdev)
 
 	ret = qmi_handle_init(&sample->qmi, TEST_DATA_REQ_MAX_MSG_LEN_V01,
 			      NULL,
-			      qmi_sample_handlers);
+			      qmi_sample_handlers, 0);
 	if (ret < 0)
 		return ret;
 
@@ -590,7 +590,7 @@ static int qmi_sample_init(void)
 	if (ret)
 		goto err_remove_debug_dir;
 
-	ret = qmi_handle_init(&lookup_client, 0, &lookup_ops, NULL);
+	ret = qmi_handle_init(&lookup_client, 0, &lookup_ops, NULL, 0);
 	if (ret < 0)
 		goto err_unregister_driver;
 
-- 
2.17.1



-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
