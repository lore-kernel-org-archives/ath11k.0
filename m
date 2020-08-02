Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Message-ID: <ADUAnwD8DVByMMSsrG-r3Kri.3.1596374087585.Hmail.wenhu.wang@vivo.com>
Subject: =?UTF-8?B?UmU6UmU6IFtQQVRDSF0gc29jOiBxbWk6IGFsbG93IHVzZXIgdG8gc2V0IGhhbmRsZSB3cSB0byBoaXByaW8=?=
In-Reply-To: <20200727204521.GB229995@builder.lan>
MIME-Version: 1.0
From: =?UTF-8?B?546L5paH6JmO?= <wenhu.wang@vivo.com>
Date: Sun, 2 Aug 2020 21:14:47 +0800 (GMT+08:00)
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
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: ohad@wizery.com, linux-wireless@vger.kernel.org, alsa-devel@alsa-project.org, elder@kernel.org, linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, ath10k@lists.infradead.org, ath11k@lists.infradead.org, agross@kernel.org, srinivas.kandagatla@linaro.org, sibis@codeaurora.org, netdev@vger.kernel.org, kuba@kernel.org, davem@davemloft.net, kvalo@codeaurora.org


>> Currently the qmi_handle is initialized single threaded and strictly
>> ordered with the active set to 1. This is pretty simple and safe but
>> sometimes ineffency. So it is better to allow user to decide whether
>> a high priority workqueue should be used.
>
>Can you please describe a scenario where this is needed/desired and
>perhaps also comment on why this is not always desired?
>

Well, one scenario is that when the AP wants to check the status of the
subsystems and the whole QMI data path. It first sends out an indication
which asks the subsystems to report their status. After the subsystems send
responses to the AP, the responses then are queued on the workqueue of
the QMI handler. Actually the AP is configured to do the check in a specific
interval regularly. And it check the report counts within a specific delay after
it sends out the related indication. When the AP has been under a heavy
load for long, the reports are queue their without CPU resource to update
the report counts within the specific delay. As a result, the thread that checks
the report counts takes it misleadingly that the QMI data path or the subsystems
are crashed.

The patch can really resolve the problem mentioned abolve.

For narmal situations, it is enough to just use normal priority QMI workqueue.

>Regards,
>Bjorn
>
>> 
>> Signed-off-by: Wang Wenhu <wenhu.wang@vivo.com>
>> ---
>>  drivers/net/ipa/ipa_qmi.c             | 4 ++--
>>  drivers/net/wireless/ath/ath10k/qmi.c | 2 +-
>>  drivers/net/wireless/ath/ath11k/qmi.c | 2 +-
>>  drivers/remoteproc/qcom_sysmon.c      | 2 +-
>>  drivers/slimbus/qcom-ngd-ctrl.c       | 4 ++--
>>  drivers/soc/qcom/pdr_interface.c      | 4 ++--
>>  drivers/soc/qcom/qmi_interface.c      | 9 +++++++--
>>  include/linux/soc/qcom/qmi.h          | 3 ++-
>>  samples/qmi/qmi_sample_client.c       | 4 ++--
>>  9 files changed, 20 insertions(+), 14 deletions(-)

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
