Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from so254-31.mailgun.net ([198.61.254.31])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kmtPg-00006r-6M
 for ath11k@lists.infradead.org; Wed, 09 Dec 2020 06:57:25 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH v3] ath11k: fix rmmod failure if qmi sequence fails
References: <1606916215-24643-1-git-send-email-akolli@codeaurora.org>
Date: Wed, 09 Dec 2020 08:57:17 +0200
In-Reply-To: <1606916215-24643-1-git-send-email-akolli@codeaurora.org>
 (Anilkumar Kolli's message of "Wed, 2 Dec 2020 19:06:55 +0530")
Message-ID: <877dprcvqq.fsf@codeaurora.org>
MIME-Version: 1.0
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
To: Anilkumar Kolli <akolli@codeaurora.org>
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org

Anilkumar Kolli <akolli@codeaurora.org> writes:

> QMI sequence fails if caldata file is not available.
> It is observed that 'rmmod ath11k' fails if qmi message fails.
> With this patch rmmod/insmod is working.
>
> Logs:
> Direct firmware load for IPQ8074/caldata.bin failed with error -2
> Falling back to user helper
> qmi failed to load CAL: IPQ8074/caldata.bin
> qmi failed to load board data file:-11
>
> Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.4.0.1-00009-QCAHKSWPL_SILICONZ-1
> Tested-on: QCA6390 hw2.0 PCI WLAN.HST.1.0.1-01699-QCAHSTSWPLZ_V2_TO_X86-1
>
> Signed-off-by: Anilkumar Kolli <akolli@codeaurora.org>

[...]

> @@ -2637,6 +2643,7 @@ static void ath11k_qmi_driver_event_work(struct work_struct *work)
>  					      event_work);
>  	struct ath11k_qmi_driver_event *event;
>  	struct ath11k_base *ab = qmi->ab;
> +	int ret = 0;
>  
>  	spin_lock(&qmi->event_lock);
>  	while (!list_empty(&qmi->event_list)) {
> @@ -2650,19 +2657,20 @@ static void ath11k_qmi_driver_event_work(struct work_struct *work)
>  
>  		switch (event->type) {
>  		case ATH11K_QMI_EVENT_SERVER_ARRIVE:
> -			ath11k_qmi_event_server_arrive(qmi);
> +			ret = ath11k_qmi_event_server_arrive(qmi);
>  			break;
>  		case ATH11K_QMI_EVENT_SERVER_EXIT:
>  			set_bit(ATH11K_FLAG_CRASH_FLUSH, &ab->dev_flags);
>  			set_bit(ATH11K_FLAG_RECOVERY, &ab->dev_flags);
>  			break;
>  		case ATH11K_QMI_EVENT_REQUEST_MEM:
> -			ath11k_qmi_event_mem_request(qmi);
> +			ret = ath11k_qmi_event_mem_request(qmi);
>  			break;
>  		case ATH11K_QMI_EVENT_FW_MEM_READY:
> -			ath11k_qmi_event_load_bdf(qmi);
> +			ret = ath11k_qmi_event_load_bdf(qmi);
>  			break;
>  		case ATH11K_QMI_EVENT_FW_READY:
> +			clear_bit(ATH11K_FLAG_QMI_FAIL, &ab->dev_flags);
>  			if (test_bit(ATH11K_FLAG_REGISTERED, &ab->dev_flags)) {
>  				ath11k_hal_dump_srng_stats(ab);
>  				queue_work(ab->workqueue, &ab->restart_work);
> @@ -2688,6 +2696,9 @@ static void ath11k_qmi_driver_event_work(struct work_struct *work)
>  			break;
>  		}
>  		kfree(event);
> +		if (ret < 0)
> +			set_bit(ATH11K_FLAG_QMI_FAIL, &ab->dev_flags);
> +

In the pending branch I moved the error handling after the function
calls to make it more visible. Here readibility is more important than
reducing lines of code.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
