Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBE85C47DDF
	for <ath11k@archiver.kernel.org>; Wed, 31 Jan 2024 10:51:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bT+6EzFnYFRcUGul11OVbMhJB9IMcun02+JmsHfFfrg=; b=THM5VvA5WAX+tWbG4Rn/zBOFnN
	vxTEIuWt4x1FWvfHGlF4RyAad1Q713YXB3/xLceOuorthRhV1ZMhEzAzsnT2wZsZ5xzF4CjSYRjPn
	B70vE5tK78sotSGp3bYdT7+qjSYufD6fDHjL4mvuU4SRU3R7HNaE1R4i30xXQXd2J6v0BO7ijRskN
	vwE9MRkOoULPyxJaUbny8XPuQhpESpIzjy1ZwUlmCm/fIwHHCco6iG/224g8WuiMUkogYILrjF8Sz
	AgMzRH07DedhS6vVgalHSXWLQqjEd4btSqrGsCRh7nisSx6Uo2hN4lBFMBNqOZluhgpHSq9VdV7X5
	c6vdcHdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rV8CE-00000002tIM-0jAa;
	Wed, 31 Jan 2024 10:51:58 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rV8CA-00000002tGm-3iHM
	for ath11k@lists.infradead.org;
	Wed, 31 Jan 2024 10:51:56 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40V77IqS009657;
	Wed, 31 Jan 2024 10:51:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=bT+6EzFnYFRcUGul11OVbMhJB9IMcun02+JmsHfFfrg=; b=iJ
	4VPC6EvBMp18UsCalz6i+SnXqYwGfkDppB9D5TjVQg8fMq4t6HzFG4wx3s3NSBgs
	CX5AhqO6I+qim4PtHp/D1SOIyEH3RNiTSwujEOyqyQg5jiwje26u+gunSsCyeup2
	n++NUCcav9gmYtHlV5plMciMTHffTpiOJzNnnvBKZ8VpYWfIRY2gw8w8OQfcTkql
	KoCu+SI6Z1bctWrIKhhWLDFD1w2ttyPMrXiLC/XUyj7Ec7JoX7E/ZF+hQVYx9Eah
	vF2R/aEo7jFgYHE+aiMTleKLsw0wx3DK5P9T9JWZJkOIbuHe8+CdlLf3aZJCyZiF
	qa4ZheB3tZmOiSjfwufg==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3vyb0csfex-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 31 Jan 2024 10:51:48 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 40VAplOS021120
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 31 Jan 2024 10:51:47 GMT
Received: from [10.231.195.68] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Wed, 31 Jan
 2024 02:51:45 -0800
Message-ID: <350b3fb0-5941-4a52-b25c-9ad7aecd0fac@quicinc.com>
Date: Wed, 31 Jan 2024 18:51:43 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v2 1/8] bus: mhi: host: add
 mhi_power_down_no_destroy()
Content-Language: en-US
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Kalle Valo
	<kvalo@kernel.org>
CC: <mhi@lists.linux.dev>, <ath11k@lists.infradead.org>,
        <linux-wireless@vger.kernel.org>
References: <20231127162022.518834-1-kvalo@kernel.org>
 <20231127162022.518834-2-kvalo@kernel.org> <20240130180411.GA4218@thinkpad>
From: Baochen Qiang <quic_bqiang@quicinc.com>
In-Reply-To: <20240130180411.GA4218@thinkpad>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: _DwbSZ5rHQ-yoZB1xnQLAIo1O3-2k25F
X-Proofpoint-ORIG-GUID: _DwbSZ5rHQ-yoZB1xnQLAIo1O3-2k25F
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-31_05,2024-01-30_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 adultscore=0
 phishscore=0 suspectscore=0 bulkscore=0 malwarescore=0 mlxlogscore=999
 mlxscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401190000 definitions=main-2401310082
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240131_025154_982967_5767B63A 
X-CRM114-Status: GOOD (  33.14  )
X-BeenThere: ath11k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath11k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org



On 1/31/2024 2:04 AM, Manivannan Sadhasivam wrote:
> On Mon, Nov 27, 2023 at 06:20:15PM +0200, Kalle Valo wrote:
>> From: Baochen Qiang <quic_bqiang@quicinc.com>
>>
>> If ath11k tries to call mhi_power_up() during resume it fails:
>>
> 
> This is confusing! Maybe this is what confused me initially. mhi_sync_power_up()
> never fails, but ath11k timesout waiting for QMI. You also confirmed the same
> [1].

mhi_sync_power_up() creates MHI devices which fails to get probed. So 
from the view of ath11k it fails, while from the sense of code 
execuation it succeeds. Will rephrase to avoid confusion.

> 
>> ath11k_pci 0000:06:00.0: timeout while waiting for restart complete
>>
>> This happens because when calling mhi_power_up() the MHI subsystem eventually
>> calls device_add() from mhi_create_devices() but the device creation is
>> deferred:
>>
>> mhi mhi0_IPCR: Driver qcom_mhi_qrtr force probe deferral
>>
>> The reason for deferring device creation is explained in dpm_prepare():
>>
>> 	/*
>> 	 * It is unsafe if probing of devices will happen during suspend or
>> 	 * hibernation and system behavior will be unpredictable in this case.
>> 	 * So, let's prohibit device's probing here and defer their probes
>> 	 * instead. The normal behavior will be restored in dpm_complete().
>> 	 */
>>
>> Because the device probe is deferred, the qcom_mhi_qrtr_probe() is not called and
>> qcom_mhi_qrtr_dl_callback() fails silently as qdev is zero:
>>
>> static void qcom_mhi_qrtr_dl_callback(struct mhi_device *mhi_dev,
>> 				      struct mhi_result *mhi_res)
>> {
>> 	struct qrtr_mhi_dev *qdev = dev_get_drvdata(&mhi_dev->dev);
>> 	int rc;
>>
>> 	if (!qdev || mhi_res->transaction_status)
>> 		return;
>>
>> So what this means that QRTR is not delivering messages and the QMI connection
>> is not working between ath11k and the firmware, resulting a failure in firmware
>> initialisation.
>>
>> To fix this add new function mhi_power_down_no_destroy() which does not destroy
>> the devices during power down. This way mhi_power_up() can be called during
>> resume and we can get ath11k hibernation working with the following patches.
>>
>> Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.30
>>
>> Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>
>> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>
>> ---
>>   drivers/bus/mhi/host/init.c     |  1 +
>>   drivers/bus/mhi/host/internal.h |  1 +
>>   drivers/bus/mhi/host/pm.c       | 26 +++++++++++++++++++-------
>>   include/linux/mhi.h             | 29 +++++++++++++++++++++++++++--
>>   4 files changed, 48 insertions(+), 9 deletions(-)
>>
>> diff --git a/drivers/bus/mhi/host/init.c b/drivers/bus/mhi/host/init.c
>> index 65ceac1837f9..e626b03ffafa 100644
>> --- a/drivers/bus/mhi/host/init.c
>> +++ b/drivers/bus/mhi/host/init.c
>> @@ -43,6 +43,7 @@ const char * const dev_state_tran_str[DEV_ST_TRANSITION_MAX] = {
>>   	[DEV_ST_TRANSITION_FP] = "FLASH PROGRAMMER",
>>   	[DEV_ST_TRANSITION_SYS_ERR] = "SYS ERROR",
>>   	[DEV_ST_TRANSITION_DISABLE] = "DISABLE",
>> +	[DEV_ST_TRANSITION_DISABLE_DESTROY_DEVICE] = "DISABLE (DESTROY DEVICE)",
>>   };
>>   
>>   const char * const mhi_ch_state_type_str[MHI_CH_STATE_TYPE_MAX] = {
>> diff --git a/drivers/bus/mhi/host/internal.h b/drivers/bus/mhi/host/internal.h
>> index 30ac415a3000..3f45c9c447bd 100644
>> --- a/drivers/bus/mhi/host/internal.h
>> +++ b/drivers/bus/mhi/host/internal.h
>> @@ -69,6 +69,7 @@ enum dev_st_transition {
>>   	DEV_ST_TRANSITION_FP,
>>   	DEV_ST_TRANSITION_SYS_ERR,
>>   	DEV_ST_TRANSITION_DISABLE,
>> +	DEV_ST_TRANSITION_DISABLE_DESTROY_DEVICE,
>>   	DEV_ST_TRANSITION_MAX,
>>   };
>>   
>> diff --git a/drivers/bus/mhi/host/pm.c b/drivers/bus/mhi/host/pm.c
>> index a2f2feef1476..8833b0248393 100644
>> --- a/drivers/bus/mhi/host/pm.c
>> +++ b/drivers/bus/mhi/host/pm.c
>> @@ -458,7 +458,8 @@ static int mhi_pm_mission_mode_transition(struct mhi_controller *mhi_cntrl)
>>   }
>>   
>>   /* Handle shutdown transitions */
>> -static void mhi_pm_disable_transition(struct mhi_controller *mhi_cntrl)
>> +static void mhi_pm_disable_transition(struct mhi_controller *mhi_cntrl,
>> +				      bool destroy_device)
>>   {
>>   	enum mhi_pm_state cur_state;
>>   	struct mhi_event *mhi_event;
>> @@ -520,8 +521,10 @@ static void mhi_pm_disable_transition(struct mhi_controller *mhi_cntrl)
>>   	dev_dbg(dev, "Waiting for all pending threads to complete\n");
>>   	wake_up_all(&mhi_cntrl->state_event);
>>   
>> -	dev_dbg(dev, "Reset all active channels and remove MHI devices\n");
>> -	device_for_each_child(&mhi_cntrl->mhi_dev->dev, NULL, mhi_destroy_device);
>> +	if (destroy_device) {
>> +		dev_dbg(dev, "Reset all active channels and remove MHI devices\n");
>> +		device_for_each_child(&mhi_cntrl->mhi_dev->dev, NULL, mhi_destroy_device);
>> +	}
>>   
>>   	mutex_lock(&mhi_cntrl->pm_mutex);
>>   
>> @@ -806,7 +809,10 @@ void mhi_pm_st_worker(struct work_struct *work)
>>   			mhi_pm_sys_error_transition(mhi_cntrl);
>>   			break;
>>   		case DEV_ST_TRANSITION_DISABLE:
>> -			mhi_pm_disable_transition(mhi_cntrl);
>> +			mhi_pm_disable_transition(mhi_cntrl, false);
>> +			break;
>> +		case DEV_ST_TRANSITION_DISABLE_DESTROY_DEVICE:
>> +			mhi_pm_disable_transition(mhi_cntrl, true);
>>   			break;
>>   		default:
>>   			break;
>> @@ -1160,7 +1166,8 @@ int mhi_async_power_up(struct mhi_controller *mhi_cntrl)
>>   }
>>   EXPORT_SYMBOL_GPL(mhi_async_power_up);
>>   
>> -void mhi_power_down(struct mhi_controller *mhi_cntrl, bool graceful)
>> +void __mhi_power_down(struct mhi_controller *mhi_cntrl, bool graceful,
>> +		      bool destroy_device)
>>   {
>>   	enum mhi_pm_state cur_state, transition_state;
>>   	struct device *dev = &mhi_cntrl->mhi_dev->dev;
>> @@ -1196,14 +1203,19 @@ void mhi_power_down(struct mhi_controller *mhi_cntrl, bool graceful)
>>   	write_unlock_irq(&mhi_cntrl->pm_lock);
>>   	mutex_unlock(&mhi_cntrl->pm_mutex);
>>   
>> -	mhi_queue_state_transition(mhi_cntrl, DEV_ST_TRANSITION_DISABLE);
>> +	if (destroy_device)
>> +		mhi_queue_state_transition(mhi_cntrl,
>> +					   DEV_ST_TRANSITION_DISABLE_DESTROY_DEVICE);
>> +	else
>> +		mhi_queue_state_transition(mhi_cntrl,
>> +					   DEV_ST_TRANSITION_DISABLE);
>>   
>>   	/* Wait for shutdown to complete */
>>   	flush_work(&mhi_cntrl->st_worker);
>>   
>>   	disable_irq(mhi_cntrl->irq[0]);
>>   }
>> -EXPORT_SYMBOL_GPL(mhi_power_down);
>> +EXPORT_SYMBOL_GPL(__mhi_power_down);
> 
> This is a helper, so should not be exported. You should export the API instead.
> 
>>   
>>   int mhi_sync_power_up(struct mhi_controller *mhi_cntrl)
>>   {
>> diff --git a/include/linux/mhi.h b/include/linux/mhi.h
>> index d0f9b522f328..ae092bc8b97e 100644
>> --- a/include/linux/mhi.h
>> +++ b/include/linux/mhi.h
>> @@ -648,12 +648,37 @@ int mhi_async_power_up(struct mhi_controller *mhi_cntrl);
>>    */
>>   int mhi_sync_power_up(struct mhi_controller *mhi_cntrl);
>>   
>> +void __mhi_power_down(struct mhi_controller *mhi_cntrl, bool graceful,
>> +		    bool destroy_device);
> 
> This is a helper, so make it static.
> 
>> +
>>   /**
>> - * mhi_power_down - Start MHI power down sequence
>> + * mhi_power_down - Start MHI power down sequence. See also
>> + * mhi_power_down_no_destroy() which is a variant of this for suspend.
> 
> suspend/hibernation
> 
>> + *
>>    * @mhi_cntrl: MHI controller
>>    * @graceful: Link is still accessible, so do a graceful shutdown process
>>    */
>> -void mhi_power_down(struct mhi_controller *mhi_cntrl, bool graceful);
>> +static inline void mhi_power_down(struct mhi_controller *mhi_cntrl, bool graceful)
> 
> No, API cannot be static inline. Make it global.
> 
>> +{
>> +	__mhi_power_down(mhi_cntrl, graceful, true);
>> +}
>> +
>> +/**
>> + * mhi_power_down_no_destroy - Start MHI power down sequence but don't
>> + * destroy struct devices. This is a variant for mhi_power_down() and is a
> 
> "struct devices for channels"
> 
>> + * workaround to make it possible to use mhi_power_up() in a resume
> 
> You should mention that the devices are not destroyed and this would be useful
> in suspend/hibernation.
> 
>> + * handler. When using this variant the caller must also call
>> + * mhi_prepare_all_for_transfer_autoqueue() and
> 
> mhi_prepare_all_for_transfer*()
> 
>> + * mhi_unprepare_all_from_transfer().
>> + *
>> + * @mhi_cntrl: MHI controller
>> + * @graceful: Link is still accessible, so do a graceful shutdown process
>> + */
>> +static inline void mhi_power_down_no_destroy(struct mhi_controller *mhi_cntrl,
>> +					     bool graceful)
> 
> Same as above, make it global.
> 
> - Mani
> 

