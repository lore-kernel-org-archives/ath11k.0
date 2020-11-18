Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from m42-4.mailgun.net ([69.72.42.4])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kfSth-00054M-Qf
 for ath11k@lists.infradead.org; Wed, 18 Nov 2020 19:13:42 +0000
MIME-Version: 1.0
Date: Wed, 18 Nov 2020 11:13:38 -0800
From: Bhaumik Bhatt <bbhatt@codeaurora.org>
Subject: Re: [PATCH] net: qrtr: Unprepare MHI channels during remove
In-Reply-To: <5e94c0be-9402-7309-5d65-857a27d1f491@codeaurora.org>
References: <1605723625-11206-1-git-send-email-bbhatt@codeaurora.org>
 <5e94c0be-9402-7309-5d65-857a27d1f491@codeaurora.org>
Message-ID: <4369f0e36886db303f5543b8a380b9d0@codeaurora.org>
List-Id: <ath11k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
Reply-To: bbhatt@codeaurora.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+kvalo=adurom.com@lists.infradead.org
To: Jeffrey Hugo <jhugo@codeaurora.org>
Cc: loic.poulain@linaro.org, linux-arm-msm@vger.kernel.org, cjhuang@codeaurora.org, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, clew@codeaurora.org, netdev@vger.kernel.org, manivannan.sadhasivam@linaro.org, hemantk@codeaurora.org, jhugo=codeaurora.org@codeaurora.org, ath11k@lists.infradead.org, kvalo@codeaurora.org

Hi Jeff,
On 2020-11-18 10:34 AM, Jeffrey Hugo wrote:
> On 11/18/2020 11:20 AM, Bhaumik Bhatt wrote:
>> Reset MHI device channels when driver remove is called due to
>> module unload or any crash scenario. This will make sure that
>> MHI channels no longer remain enabled for transfers since the
>> MHI stack does not take care of this anymore after the auto-start
>> channels feature was removed.
>> 
>> Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
>> ---
>>   net/qrtr/mhi.c | 1 +
>>   1 file changed, 1 insertion(+)
>> 
>> diff --git a/net/qrtr/mhi.c b/net/qrtr/mhi.c
>> index 7100f0b..2bf2b19 100644
>> --- a/net/qrtr/mhi.c
>> +++ b/net/qrtr/mhi.c
>> @@ -104,6 +104,7 @@ static void qcom_mhi_qrtr_remove(struct mhi_device 
>> *mhi_dev)
>>   	struct qrtr_mhi_dev *qdev = dev_get_drvdata(&mhi_dev->dev);
>>     	qrtr_endpoint_unregister(&qdev->ep);
>> +	mhi_unprepare_from_transfer(mhi_dev);
>>   	dev_set_drvdata(&mhi_dev->dev, NULL);
>>   }
>> 
> 
> I admit, I didn't pay much attention to the auto-start being removed,
> but this seems odd to me.
It allows fair and common treatment for all client drivers.
> 
> As a client, the MHI device is being removed, likely because of some
> factor outside of my control, but I still need to clean it up?  This
> really feels like something MHI should be handling.
It isn't really outside of a client's control every time. If a client 
driver
module is unloaded for example, it should be in their responsibility to 
clean
up and send commands to close those channels which allows the device to 
clean
up the context.

In the event of a kernel panic or some device crash outside of a 
client's
control, this function will just free some memory and return right away 
as MHI
knows not to pursue it over the link anyway.

Some client drivers depend on USB or other drivers, which allows 
flexibility on
their end as to when to call these MHI prepare/unprepare for transfer 
APIs.

Thanks,
Bhaumik
---
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora 
Forum,
a Linux Foundation Collaborative Project

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
