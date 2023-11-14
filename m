Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEA28C4332F
	for <ath11k@archiver.kernel.org>; Tue, 14 Nov 2023 01:27:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oarGtYJ95F7UTuvS0Lk6nqHgZyclekkjqGxrHesYO/8=; b=fd9bUyoOLsIgBx
	QmMB0NSiF9AsN6Xb1/rdGMDWRzirLQOcakUQ67uYoVsoN9wcmBx98rnt6je+7w0VOe0qAbxWeYsS0
	BUAuFV2hI6VxXj4ci/3JO7YRcHlZ3rh92ILMOWIfx/2ZFUtW2tvvIDupsYB9Sec0s4jjKwZr65Mlh
	G2SiyCGIGzwsfTbqM+eGumIXOoOxTATiMc03h17ErO1ChpF0T+8komlP/Az0Ar9AOMXbp4dK+fEWx
	wqYClxYlZUroiwxI9CgHMDO49XHTsmKlpT2zG02gW8J4fVU0AHkdcE70M9NQUDviGAgY4Id5JuyYk
	fkmnxY407nxGXIUcsstQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r2iCt-00F0Lb-2G;
	Tue, 14 Nov 2023 01:27:11 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r2iCq-00F0L0-1k
	for ath11k@lists.infradead.org;
	Tue, 14 Nov 2023 01:27:10 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3ADNcuPn025820;
	Tue, 14 Nov 2023 01:26:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=8oOnmGcddUvxzGMjMZyFcFuv06vbCd3bpzZpzC5bMMI=;
 b=LUClkjZ3+K1xhK9riG2CX4DsZM7rwIHpbeHCB1Jfrrvs+nwRK5vf/1UK/SSJzR+lRlsz
 qjWN3C8o9zACBDTiuY8x/ENLNmlZXAnHj6rSxCdZscSBfEKGRmg0EKNT2YFGrv5aYgO3
 b6nG3yrpmLyAp2YsTB5+KEVQVyh85mNUbDVQYrrkHpDb0vHu/FFNrt8azpUXYt9TukRU
 1hZlypjiEkFMQaXFgN2J8RlgX8NSAl6iESnNRl21KUFjPqpPYecryakmVmpSVA2zYHIV
 ZKMQ1zQcG3PVrX8PYotMGjMKhdkoIgJj92aHwNDldDu0qBcFm/xKyYOo6C8c3R+b7o+q lA== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ubqvt8wr9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 14 Nov 2023 01:26:56 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3AE1Qto0003847
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 14 Nov 2023 01:26:55 GMT
Received: from [10.71.114.194] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.39; Mon, 13 Nov
 2023 17:26:55 -0800
Message-ID: <e0df4f22-c867-410b-8868-5a8f2e55f9c6@quicinc.com>
Date: Mon, 13 Nov 2023 17:26:09 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 1/8] bus: mhi: host: add mhi_power_down_no_destroy()
Content-Language: en-US
To: Kalle Valo <kvalo@kernel.org>, <mhi@lists.linux.dev>
CC: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>
References: <20231110102202.3168243-1-kvalo@kernel.org>
 <20231110102202.3168243-2-kvalo@kernel.org>
From: Mayank Rana <quic_mrana@quicinc.com>
In-Reply-To: <20231110102202.3168243-2-kvalo@kernel.org>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: VHZ3YcRt_eme5UcZo6hPXdqLfu9fn7wt
X-Proofpoint-GUID: VHZ3YcRt_eme5UcZo6hPXdqLfu9fn7wt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-14_01,2023-11-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 malwarescore=0 mlxlogscore=999 clxscore=1011 spamscore=0 impostorscore=0
 suspectscore=0 phishscore=0 priorityscore=1501 bulkscore=0 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311140009
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231113_172708_739114_B5C3ABD0 
X-CRM114-Status: GOOD (  36.38  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

On 11/10/2023 2:21 AM, Kalle Valo wrote:
> From: Baochen Qiang <quic_bqiang@quicinc.com>
> 
> If ath11k tries to call mhi_power_up() during resume it fails:
> 
> ath11k_pci 0000:06:00.0: timeout while waiting for restart complete
> 
> This happens because when calling mhi_power_up() the MHI subsystem eventually
> calls device_add() from mhi_create_devices() but the device creation is
> deferred:
> 
> mhi mhi0_IPCR: Driver qcom_mhi_qrtr force probe deferral
> 
> The reason for deferring device creation is explained in dpm_prepare():
> 
> 	/*
> 	 * It is unsafe if probing of devices will happen during suspend or
> 	 * hibernation and system behavior will be unpredictable in this case.
> 	 * So, let's prohibit device's probing here and defer their probes
> 	 * instead. The normal behavior will be restored in dpm_complete().
> 	 */
have you consider registering for pm_notifier callback specifically for 
PM_POST_HIBERNATION (Documentation/power/notifiers.txt), and then making 
decision of calling MHI power up sequence which would make sure that 
created device based driver probe() is completed.
> 
> Because the device probe is deferred, the qcom_mhi_qrtr_probe() is not called and
> qcom_mhi_qrtr_dl_callback() fails silently as qdev is zero:
> 
> static void qcom_mhi_qrtr_dl_callback(struct mhi_device *mhi_dev,
> 				      struct mhi_result *mhi_res)
> {
> 	struct qrtr_mhi_dev *qdev = dev_get_drvdata(&mhi_dev->dev);
> 	int rc;
> 
> 	if (!qdev || mhi_res->transaction_status)
> 		return;
> 
> So what this means that QRTR is not delivering messages and the QMI connection
> is not working between ath11k and the firmware, resulting a failure in firmware
> initialisation.
> 
> To fix this add new function mhi_power_down_no_destroy() which does not destroy
> the devices during power down. This way mhi_power_up() can be called during
> resume and we can get ath11k hibernation working with the following patches.
> 
> Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.30
> 
> Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>
> ---
>   drivers/bus/mhi/host/internal.h |  1 +
>   drivers/bus/mhi/host/pm.c       | 26 +++++++++++++++++++-------
>   include/linux/mhi.h             | 29 +++++++++++++++++++++++++++--
>   3 files changed, 47 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/bus/mhi/host/internal.h b/drivers/bus/mhi/host/internal.h
> index 2e139e76de4c..d1033af285e2 100644
> --- a/drivers/bus/mhi/host/internal.h
> +++ b/drivers/bus/mhi/host/internal.h
> @@ -69,6 +69,7 @@ enum dev_st_transition {
>   	DEV_ST_TRANSITION_FP,
>   	DEV_ST_TRANSITION_SYS_ERR,
>   	DEV_ST_TRANSITION_DISABLE,
> +	DEV_ST_TRANSITION_DISABLE_DESTROY_DEVICE,
>   	DEV_ST_TRANSITION_MAX,
>   };
>   
> diff --git a/drivers/bus/mhi/host/pm.c b/drivers/bus/mhi/host/pm.c
> index 8a4362d75fc4..e0e429adbda6 100644
> --- a/drivers/bus/mhi/host/pm.c
> +++ b/drivers/bus/mhi/host/pm.c
> @@ -453,7 +453,8 @@ static int mhi_pm_mission_mode_transition(struct mhi_controller *mhi_cntrl)
>   }
>   
>   /* Handle shutdown transitions */
> -static void mhi_pm_disable_transition(struct mhi_controller *mhi_cntrl)
> +static void mhi_pm_disable_transition(struct mhi_controller *mhi_cntrl,
> +				      bool destroy_device)
>   {
>   	enum mhi_pm_state cur_state;
>   	struct mhi_event *mhi_event;
> @@ -515,8 +516,10 @@ static void mhi_pm_disable_transition(struct mhi_controller *mhi_cntrl)
>   	dev_dbg(dev, "Waiting for all pending threads to complete\n");
>   	wake_up_all(&mhi_cntrl->state_event);
>   
> -	dev_dbg(dev, "Reset all active channels and remove MHI devices\n");
> -	device_for_each_child(&mhi_cntrl->mhi_dev->dev, NULL, mhi_destroy_device);
> +	if (destroy_device) {
> +		dev_dbg(dev, "Reset all active channels and remove MHI devices\n");
> +		device_for_each_child(&mhi_cntrl->mhi_dev->dev, NULL, mhi_destroy_device);
> +	}
>   
>   	mutex_lock(&mhi_cntrl->pm_mutex);
>   
> @@ -801,7 +804,10 @@ void mhi_pm_st_worker(struct work_struct *work)
>   			mhi_pm_sys_error_transition(mhi_cntrl);
>   			break;
>   		case DEV_ST_TRANSITION_DISABLE:
> -			mhi_pm_disable_transition(mhi_cntrl);
> +			mhi_pm_disable_transition(mhi_cntrl, false);
> +			break;
> +		case DEV_ST_TRANSITION_DISABLE_DESTROY_DEVICE:
> +			mhi_pm_disable_transition(mhi_cntrl, true);
>   			break;
>   		default:
>   			break;
> @@ -1154,7 +1160,8 @@ int mhi_async_power_up(struct mhi_controller *mhi_cntrl)
>   }
>   EXPORT_SYMBOL_GPL(mhi_async_power_up);
>   
> -void mhi_power_down(struct mhi_controller *mhi_cntrl, bool graceful)
> +void __mhi_power_down(struct mhi_controller *mhi_cntrl, bool graceful,
> +		      bool destroy_device)
>   {
>   	enum mhi_pm_state cur_state, transition_state;
>   	struct device *dev = &mhi_cntrl->mhi_dev->dev;
> @@ -1190,14 +1197,19 @@ void mhi_power_down(struct mhi_controller *mhi_cntrl, bool graceful)
>   	write_unlock_irq(&mhi_cntrl->pm_lock);
>   	mutex_unlock(&mhi_cntrl->pm_mutex);
>   
> -	mhi_queue_state_transition(mhi_cntrl, DEV_ST_TRANSITION_DISABLE);
> +	if (destroy_device)
> +		mhi_queue_state_transition(mhi_cntrl,
> +					   DEV_ST_TRANSITION_DISABLE_DESTROY_DEVICE);
> +	else
> +		mhi_queue_state_transition(mhi_cntrl,
> +					   DEV_ST_TRANSITION_DISABLE);
>   
>   	/* Wait for shutdown to complete */
>   	flush_work(&mhi_cntrl->st_worker);
>   
>   	disable_irq(mhi_cntrl->irq[0]);
>   }
> -EXPORT_SYMBOL_GPL(mhi_power_down);
> +EXPORT_SYMBOL_GPL(__mhi_power_down);
>   
>   int mhi_sync_power_up(struct mhi_controller *mhi_cntrl)
>   {
> diff --git a/include/linux/mhi.h b/include/linux/mhi.h
> index 039943ec4d4e..85edc9c5df88 100644
> --- a/include/linux/mhi.h
> +++ b/include/linux/mhi.h
> @@ -644,12 +644,37 @@ int mhi_async_power_up(struct mhi_controller *mhi_cntrl);
>    */
>   int mhi_sync_power_up(struct mhi_controller *mhi_cntrl);
>   
> +void __mhi_power_down(struct mhi_controller *mhi_cntrl, bool graceful,
> +		    bool destroy_device);
> +
>   /**
> - * mhi_power_down - Start MHI power down sequence
> + * mhi_power_down - Start MHI power down sequence. See also
> + * mhi_power_down_no_destroy() which is a variant of this for suspend.
> + *
>    * @mhi_cntrl: MHI controller
>    * @graceful: Link is still accessible, so do a graceful shutdown process
>    */
> -void mhi_power_down(struct mhi_controller *mhi_cntrl, bool graceful);
> +static inline void mhi_power_down(struct mhi_controller *mhi_cntrl, bool graceful)
> +{
> +	__mhi_power_down(mhi_cntrl, graceful, true);
> +}
> +
> +/**
> + * mhi_power_down_no_destroy - Start MHI power down sequence but don't
> + * destroy struct devices. This is a variant for mhi_power_down() and is a
> + * workaround to make it possible to use mhi_power_up() in a resume
> + * handler. When using this variant the caller must also call
> + * mhi_prepare_all_for_transfer_autoqueue() and
> + * mhi_unprepare_all_from_transfer().
> + *
> + * @mhi_cntrl: MHI controller
> + * @graceful: Link is still accessible, so do a graceful shutdown process
> + */
> +static inline void mhi_power_down_no_destroy(struct mhi_controller *mhi_cntrl,
> +					     bool graceful)
> +{
> +	__mhi_power_down(mhi_cntrl, graceful, false);
> +}
>   
>   /**
>    * mhi_unprepare_after_power_down - Free any allocated memory after power down

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
