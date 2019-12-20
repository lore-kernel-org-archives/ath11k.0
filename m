Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail25.static.mailgun.info ([104.130.122.25])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ii8yN-0004RQ-TQ
 for ath11k@lists.infradead.org; Fri, 20 Dec 2019 03:29:05 +0000
Received: from cjhuang-station.qca.qualcomm.com (unknown [180.166.53.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: cjhuang)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 9D844C433CB
 for <ath11k@lists.infradead.org>; Fri, 20 Dec 2019 03:28:54 +0000 (UTC)
From: Carl Huang <cjhuang@codeaurora.org>
Subject: [PATCH qca6390-bringup] ath11k: enable internal sleep clock
Date: Fri, 20 Dec 2019 11:28:48 +0800
Message-Id: <1576812528-24979-1-git-send-email-cjhuang@codeaurora.org>
List-Id: <ath11k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+kvalo=adurom.com@lists.infradead.org
To: ath11k@lists.infradead.org

For QCA6390 on x86 and non-qcom platfrom, host need explicitly tell firmware
to use internal sleep clock. Some QCA6390 modules have OTP burnt with external
sleep clock selected, and these moduesl usually can't  work normally on
these platforms unless firmware selects internal sleep clock.

Signed-off-by: Carl Huang <cjhuang@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/qmi.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/qmi.c b/drivers/net/wireless/ath/ath11k/qmi.c
index d96446c..6612637 100644
--- a/drivers/net/wireless/ath/ath11k/qmi.c
+++ b/drivers/net/wireless/ath/ath11k/qmi.c
@@ -14,6 +14,8 @@
 #define BDF_FILE_NAME_PREFIX		"bdwlan"
 #define MAX_M3_FILE_NAME_LENGTH		13
 #define DEFAULT_M3_FILE_NAME		"m3.bin"
+#define SLEEP_CLOCK_SELECT_INTERNAL_BIT 0x02
+#define HOST_CSTATE_BIT 0x04
 
 static struct qmi_elem_info qmi_wlanfw_host_cap_req_msg_v01_ei[] = {
 	{
@@ -1537,6 +1539,15 @@ static int ath11k_qmi_host_cap_send(struct ath11k_base *ab)
 	req.cal_done_valid = 1;
 	req.cal_done = ab->qmi.cal_done;
 
+	req.nm_modem_valid = 1;
+	/*notify firmware that os is X86*/
+	req.nm_modem |= HOST_CSTATE_BIT;
+	/* notify firmware about the sleep clock selection,
+	 * discussed with firmware, nm_modem_bit[1] used for this purpose
+	 * x86 host driver should select internal sleep clock.
+	 */
+	req.nm_modem |= SLEEP_CLOCK_SELECT_INTERNAL_BIT;
+
 	ret = qmi_txn_init(&ab->qmi.handle, &txn,
 			   qmi_wlanfw_host_cap_resp_msg_v01_ei, &resp);
 	if (ret < 0)
-- 
2.7.4

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
