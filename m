Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C469C5478C
	for <ath11k@archiver.kernel.org>; Tue, 27 Feb 2024 06:29:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4EEgC2z2c5LElvw2LIh/ssUFuIK4JNpxaFYKe9bwlco=; b=XsZ7PNBsjzeR6zPuZ7z6ZSis67
	Ln3h1W6fv9Z50QvkJMhu9+wlYsZM44fu32SF1hU5V+OZaJZYLuIaoFmBgiB3qEvDNu8lcdzt8EFki
	ndWKSgQpuvnuxtEX42uEGTdjzbfT1qWckNkJtwGzibq7FuZnNRTV4rocT91LSx0YIJbfJC7PvY1bs
	ZzRocRa/EJpL6vqnc7HUvgnyqTy3/38Md4k/Vl/8YNVttN+AhXHb6CCgcxmNpKixfAWDkEP5FjITO
	LTuv+bkrKYnKXCjife0/CIwn/joSiKlYZ+cpF3GKv5kOiguXVF0gsoY4Nf3UxW4D7SitRr/WfQnBr
	PysyABaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1reqxn-00000003ypf-2Yne;
	Tue, 27 Feb 2024 06:29:15 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1reqxl-00000003ypE-05by
	for ath11k@lists.infradead.org;
	Tue, 27 Feb 2024 06:29:14 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 41R5s1xr008920;
	Tue, 27 Feb 2024 06:29:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=4EEgC2z2c5LElvw2LIh/ssUFuIK4JNpxaFYKe9bwlco=; b=Xq
	ydEXpNVEHZVjtpyzcpmoOAwFlBRnOQ19A2O0XG1geJxrQSRvaMAVzWY+VbRF2yKb
	U5bdjMH5Y8gxXmcF9qdcVTV2T9MvbZfJFkDhbrIeuJeaon3ubaBdsSzFZ0qft9z0
	euWi8yis4X6QHgw0pTRBuLpwl7NukzoiAFfb+VDYJxopsfOETrMyh4NPmk1b2E51
	vWd9z772jmOg4QwGjKbLtIT3kayDmPNI36FHPOxcHm5gLGS7Vj4PFkQtDyTe0Xfr
	0Aoyg6Ji0vmKHv21H8dPUPmcTO6esslb84SyyZQvQkc3ymx5MSxcD51lc0ojF54f
	wVpQLW6UEhuJUFOhKmwg==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3wha078240-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 27 Feb 2024 06:29:10 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 41R6T9f1019668
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 27 Feb 2024 06:29:09 GMT
Received: from [10.231.195.68] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Mon, 26 Feb
 2024 22:29:08 -0800
Message-ID: <5a92d18e-a3a9-4d06-a6d3-de67889d7b3b@quicinc.com>
Date: Tue, 27 Feb 2024 14:29:05 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] bus: mhi: host: add mhi_power_down_no_destroy()
Content-Language: en-US
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
CC: <ath11k@lists.infradead.org>, <mhi@lists.linux.dev>,
        <linux-wireless@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>
References: <20240221030026.10553-1-quic_bqiang@quicinc.com>
 <20240221030026.10553-2-quic_bqiang@quicinc.com>
 <20240226121542.GD8422@thinkpad>
From: Baochen Qiang <quic_bqiang@quicinc.com>
In-Reply-To: <20240226121542.GD8422@thinkpad>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: a3MWLLzuGkT-eL8WBaOEyAb7nBHtAwi-
X-Proofpoint-GUID: a3MWLLzuGkT-eL8WBaOEyAb7nBHtAwi-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-26_11,2024-02-26_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 adultscore=0
 mlxlogscore=999 clxscore=1015 suspectscore=0 bulkscore=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 spamscore=0
 malwarescore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2402120000 definitions=main-2402270050
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240226_222913_239563_6D4006C8 
X-CRM114-Status: GOOD (  38.63  )
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



On 2/26/2024 8:15 PM, Manivannan Sadhasivam wrote:
> On Wed, Feb 21, 2024 at 11:00:24AM +0800, Baochen Qiang wrote:
>> ath11k fails to resume:
>>
>> ath11k_pci 0000:06:00.0: timeout while waiting for restart complete
>>
>> This happens because when calling mhi_sync_power_up() the MHI subsystem
>> eventually calls device_add() from mhi_create_devices() but the device
>> creation is deferred:
>>
>> mhi mhi0_IPCR: Driver qcom_mhi_qrtr force probe deferral
>>
>> The reason for deferring device creation is explained in dpm_prepare():
>>
>>          /*
>>           * It is unsafe if probing of devices will happen during suspend or
>>           * hibernation and system behavior will be unpredictable in this case.
>>           * So, let's prohibit device's probing here and defer their probes
>>           * instead. The normal behavior will be restored in dpm_complete().
>>           */
>>
>> Because the device probe is deferred, the qcom_mhi_qrtr_probe() is not
>> called and thus MHI channels are not prepared:
>>
>> So what this means that QRTR is not delivering messages and the QMI connection
>> is not working between ath11k and the firmware, resulting a failure in firmware
>> initialization.
>>
>> To fix this add new function mhi_power_down_no_destroy() which doesn't destroy
>> the devices for channels during power down. This way we avoid probe defer issue
>> and finally can get ath11k hibernation working with the following patches.
>>
> 
> Upto this line is the actual commit message and below should be moved to the
> comments section of the patch.
I would like to remove below info since they are included in the cover 
letter already. And even keeping them in the comment section won't make 
them visible after patch got merged.

> 
>> Actually there is an RFC version of this change and it gets positive results
>> from multiple users. Firstly Mani doesn't like this idea and insists that an
>> MHI device should be destroyed when going to suspend/hibernation, see
>>
>> https://lore.kernel.org/mhi/20231127162022.518834-1-kvalo@kernel.org/
>>
>> Then Mani changed his mind after a further discussion with kernel PM guys,
>> see
>>
>> https://lore.kernel.org/all/21cd2098-97e1-4947-a5bb-a97582902ead@quicinc.com/
>>
>> So we come up with the regular version and it is almost identical with that RFC
>> version.
>>
>> Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.30
>>
>> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>
>> Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>
>> ---
>>   drivers/bus/mhi/host/internal.h |  4 +++-
>>   drivers/bus/mhi/host/pm.c       | 36 +++++++++++++++++++++++++++------
>>   include/linux/mhi.h             | 15 +++++++++++++-
>>   3 files changed, 47 insertions(+), 8 deletions(-)
>>
>> diff --git a/drivers/bus/mhi/host/internal.h b/drivers/bus/mhi/host/internal.h
>> index 091244cf17c6..8ce4aec56425 100644
>> --- a/drivers/bus/mhi/host/internal.h
>> +++ b/drivers/bus/mhi/host/internal.h
>> @@ -86,6 +86,7 @@ enum dev_st_transition {
>>   	DEV_ST_TRANSITION_FP,
>>   	DEV_ST_TRANSITION_SYS_ERR,
>>   	DEV_ST_TRANSITION_DISABLE,
>> +	DEV_ST_TRANSITION_DISABLE_DESTROY_DEVICE,
>>   	DEV_ST_TRANSITION_MAX,
>>   };
>>   
>> @@ -96,7 +97,8 @@ enum dev_st_transition {
>>   	dev_st_trans(MISSION_MODE,	"MISSION MODE")		\
>>   	dev_st_trans(FP,		"FLASH PROGRAMMER")	\
>>   	dev_st_trans(SYS_ERR,		"SYS ERROR")		\
>> -	dev_st_trans_end(DISABLE,	"DISABLE")
>> +	dev_st_trans(DISABLE,		"DISABLE")		\
>> +	dev_st_trans_end(DISABLE_DESTROY_DEVICE, "DISABLE (DESTROY DEVICE)")
>>   
>>   extern const char * const dev_state_tran_str[DEV_ST_TRANSITION_MAX];
>>   #define TO_DEV_STATE_TRANS_STR(state) (((state) >= DEV_ST_TRANSITION_MAX) ? \
>> diff --git a/drivers/bus/mhi/host/pm.c b/drivers/bus/mhi/host/pm.c
>> index 8b40d3f01acc..5686d32f7458 100644
>> --- a/drivers/bus/mhi/host/pm.c
>> +++ b/drivers/bus/mhi/host/pm.c
>> @@ -468,7 +468,8 @@ static int mhi_pm_mission_mode_transition(struct mhi_controller *mhi_cntrl)
>>   }
>>   
>>   /* Handle shutdown transitions */
>> -static void mhi_pm_disable_transition(struct mhi_controller *mhi_cntrl)
>> +static void mhi_pm_disable_transition(struct mhi_controller *mhi_cntrl,
>> +				      bool destroy_device)
>>   {
>>   	enum mhi_pm_state cur_state;
>>   	struct mhi_event *mhi_event;
>> @@ -530,8 +531,10 @@ static void mhi_pm_disable_transition(struct mhi_controller *mhi_cntrl)
>>   	dev_dbg(dev, "Waiting for all pending threads to complete\n");
>>   	wake_up_all(&mhi_cntrl->state_event);
>>   
>> -	dev_dbg(dev, "Reset all active channels and remove MHI devices\n");
>> -	device_for_each_child(&mhi_cntrl->mhi_dev->dev, NULL, mhi_destroy_device);
> 
> I'd be nice to add a comment here on why destroying the device is optional.
> 
>> +	if (destroy_device) {
>> +		dev_dbg(dev, "Reset all active channels and remove MHI devices\n");
>> +		device_for_each_child(&mhi_cntrl->mhi_dev->dev, NULL, mhi_destroy_device);
>> +	}
>>   
>>   	mutex_lock(&mhi_cntrl->pm_mutex);
>>   
>> @@ -821,7 +824,10 @@ void mhi_pm_st_worker(struct work_struct *work)
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
>> @@ -1175,7 +1181,8 @@ int mhi_async_power_up(struct mhi_controller *mhi_cntrl)
>>   }
>>   EXPORT_SYMBOL_GPL(mhi_async_power_up);
>>   
>> -void mhi_power_down(struct mhi_controller *mhi_cntrl, bool graceful)
>> +static void __mhi_power_down(struct mhi_controller *mhi_cntrl, bool graceful,
>> +			     bool destroy_device)
>>   {
>>   	enum mhi_pm_state cur_state, transition_state;
>>   	struct device *dev = &mhi_cntrl->mhi_dev->dev;
>> @@ -1211,15 +1218,32 @@ void mhi_power_down(struct mhi_controller *mhi_cntrl, bool graceful)
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
>> +
>> +void mhi_power_down(struct mhi_controller *mhi_cntrl, bool graceful)
>> +{
>> +	__mhi_power_down(mhi_cntrl, graceful, true);
>> +}
>>   EXPORT_SYMBOL_GPL(mhi_power_down);
>>   
>> +void mhi_power_down_no_destroy(struct mhi_controller *mhi_cntrl,
> 
> How about "mhi_power_down_keep_dev"? Not the best of the API naming suggestion,
> but it reflects what the API does.
> 
>> +			       bool graceful)
>> +{
>> +	__mhi_power_down(mhi_cntrl, graceful, false);
>> +}
>> +EXPORT_SYMBOL_GPL(mhi_power_down_no_destroy);
>> +
>>   int mhi_sync_power_up(struct mhi_controller *mhi_cntrl)
>>   {
>>   	int ret = mhi_async_power_up(mhi_cntrl);
>> diff --git a/include/linux/mhi.h b/include/linux/mhi.h
>> index 474d32cb0520..39a6a944a52c 100644
>> --- a/include/linux/mhi.h
>> +++ b/include/linux/mhi.h
>> @@ -647,12 +647,25 @@ int mhi_async_power_up(struct mhi_controller *mhi_cntrl);
>>   int mhi_sync_power_up(struct mhi_controller *mhi_cntrl);
>>   
>>   /**
>> - * mhi_power_down - Start MHI power down sequence
>> + * mhi_power_down - Start MHI power down sequence. See also
> 
> How about?
> 
> 	/**
> 	 * mhi_power_down - Power down the MHI device and also destroy the
> 	 * 		    'struct device' for the channels associated with it.
> 
> 	 ...
> 
> 	 * See also mhi_power_down_keep_dev() which is a variant of
> 	 * this API that keeps the 'struct device' for channels (useful during
> 	 * suspend/hibernation).
> 	 */
> 
>> + * mhi_power_down_no_destroy() which is a variant of this for
>> + * suspend/hibernation.
>> + *
>>    * @mhi_cntrl: MHI controller
>>    * @graceful: Link is still accessible, so do a graceful shutdown process
>>    */
>>   void mhi_power_down(struct mhi_controller *mhi_cntrl, bool graceful);
>>   
>> +/**
>> + * mhi_power_down_no_destroy - Start MHI power down sequence but don't destroy
>> + * struct devices for channels. This is a variant for mhi_power_down() and
>> + * would be useful in suspend/hibernation.
>> + *
> 
> 	/**
> 	 * mhi_power_down_keep_dev - Power down the MHI device but keep the
> 	 * 			     'struct device' for the channels
> 	 *			     associated with it.
> 
> 	 ...
> 
> 	 * This is a variant of 'mhi_power_down' and useful in scenarios such as
> 	 * suspend/hibernation where destroying of the 'struct device' is not
> 	 * needed.
> 	 */
> 
> - Mani
> 
>> + * @mhi_cntrl: MHI controller
>> + * @graceful: Link is still accessible, so do a graceful shutdown process
>> + */
>> +void mhi_power_down_no_destroy(struct mhi_controller *mhi_cntrl, bool graceful);
>> +
>>   /**
>>    * mhi_unprepare_after_power_down - Free any allocated memory after power down
>>    * @mhi_cntrl: MHI controller
>> -- 
>> 2.25.1
>>
>>
> 

