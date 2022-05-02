Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAC79C433F5
	for <ath11k@archiver.kernel.org>; Mon,  2 May 2022 09:29:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QpzWkLIUqYvBGURB5J+wr+jWi0USOI0do9Udfd30jE0=; b=dU4itj8oeLzgrc
	N10YKbBS4UhCGEzUODLQRGLwCmDgkwBy/6b9+EAxfD7ygT2jDruiw0R5L6/TmegkXx6s2fkIV24a/
	PMfE3hf7qMwdofxcIJjRitU/N0HMzdiLRFMtjCwuZAlwcq0/e6gqgq+G8k7ihcq670FOXfkCN/xDH
	gefyYJZK4bRVIM68eEjfbt9c2Xbko4mcUlz1hj2qc1t3CEpoOkOz5cn/1I4pkXTBnHvVJuHwjj1e6
	i4pMcC+uQ9CktJrC1V+yUNHZiliZ03/rOWsFsVSxeIlEcrofOTIgqxG1rnoks5rFCJUexhoT7wK+3
	ZKoN9CXljLQRes/o1pQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nlSMs-000cqx-4s; Mon, 02 May 2022 09:29:22 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nlSMo-000cpF-MU
 for ath11k@lists.infradead.org; Mon, 02 May 2022 09:29:20 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 4F1C4B815BA;
 Mon,  2 May 2022 09:29:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81C53C385A4;
 Mon,  2 May 2022 09:29:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1651483756;
 bh=mpCCh1LYSN/qxfvRph1QMzK0NnMSfrNwVpF7Uzir8sY=;
 h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
 b=UD6zVba96lAU90DevmQSKaqj+6tnduJYu1duIevC0yVgrza7FnZCVYOHDVebEtRAG
 qMRVaCz893bYhRS7MzADwI3RH/+8M/S2I52h1hWJcIEs0iO5PkadPFJcb1ma4OEOf6
 1/kvvXwSyviTE1wNmI6YpLPpF9etI15FSm5OzBUFFwY3B1cYD5+7lkVlHDbxLdP8vc
 Q8Ts3lJWBe5jyTw7oP03C0MNKR30gFVe2kS/1/8HguhpITuiYORr/Coat7U0pVJINX
 kvot+MZwwGUeE+ZIFUF68EqCVzp49tlnLgT+GOJSJ/QBWzU2LvM5g0H0oeHR5D39Va
 66JrDLUAD0Wlg==
From: Kalle Valo <kvalo@kernel.org>
To: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
Cc: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <robh@kernel.org>, <mka@chromium.org>
Subject: Re: [PATCH v7 5/9] ath11k: Fetch device information via QMI for
 WCN6750
References: <20220429170502.20080-1-quic_mpubbise@quicinc.com>
 <20220429170502.20080-6-quic_mpubbise@quicinc.com>
Date: Mon, 02 May 2022 12:29:10 +0300
In-Reply-To: <20220429170502.20080-6-quic_mpubbise@quicinc.com> (Manikanta
 Pubbisetty's message of "Fri, 29 Apr 2022 22:34:58 +0530")
Message-ID: <87k0b4b7vd.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220502_022919_079038_74CA40FC 
X-CRM114-Status: GOOD (  19.02  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

Manikanta Pubbisetty <quic_mpubbise@quicinc.com> writes:

> Since WPPS Q6 does the PCIe enumeration of WCN6750, device
> information like BAR and BAR size is not known to the APPS
> processor (Application Processor SubSystem). In order to
> fetch these details, a QMI message called device info request
> will be sent to the target. Therefore, add logic to fetch
> BAR details from the target.
>
> Tested-on: WCN6750 hw1.0 AHB WLAN.MSL.1.0.1-00887-QCAMSLSWPLZ-1
> Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-01720.1-QCAHSPSWPL_V1_V2_SILICONZ_LITE-1
> Tested-on: QCN9074 hw1.0 PCI WLAN.HK.2.5.0.1-01100-QCAHKSWPL_SILICONZ-1
> Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.4.0.1-00192-QCAHKSWPL_SILICONZ-1
>
> Signed-off-by: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>

[...]

> +static int ath11k_qmi_request_device_info(struct ath11k_base *ab)
> +{
> +	struct qmi_wlanfw_device_info_req_msg_v01 req = {};
> +	struct qmi_wlanfw_device_info_resp_msg_v01 resp = {};
> +	struct qmi_txn txn;
> +	void __iomem *bar_addr_va;
> +	int ret;
> +
> +	/* device info message req is only sent for hybrid bus devices */
> +	if (!ab->hw_params.hybrid_bus_type)
> +		return 0;
> +
> +	ret = qmi_txn_init(&ab->qmi.handle, &txn,
> +			   qmi_wlfw_device_info_resp_msg_v01_ei, &resp);
> +	if (ret < 0)
> +		goto out;
> +
> +	ret = qmi_send_request(&ab->qmi.handle, NULL, &txn,
> +			       QMI_WLANFW_DEVICE_INFO_REQ_V01,
> +			       QMI_WLANFW_DEVICE_INFO_REQ_MSG_V01_MAX_LEN,
> +			       qmi_wlanfw_device_info_req_msg_v01_ei, &req);
> +	if (ret < 0) {
> +		qmi_txn_cancel(&txn);
> +		ath11k_warn(ab, "qmi failed to send target device info request, err = %d\n",
> +			    ret);
> +		goto out;
> +	}
> +
> +	ret = qmi_txn_wait(&txn, msecs_to_jiffies(ATH11K_QMI_WLANFW_TIMEOUT_MS));
> +	if (ret < 0) {
> +		ath11k_warn(ab, "qmi failed target device info request %d\n", ret);
> +		goto out;
> +	}
> +
> +	if (resp.resp.result != QMI_RESULT_SUCCESS_V01) {
> +		ath11k_warn(ab, "qmi device info req failed, result: %d, err: %d\n",
> +			    resp.resp.result, resp.resp.error);
> +		ret = -EINVAL;
> +		goto out;
> +	}
> +
> +	if (!resp.bar_addr_valid || !resp.bar_size_valid) {
> +		ath11k_warn(ab, "qmi device info response invalid, result: %d, err: %d\n",
> +			    resp.resp.result, resp.resp.error);
> +		ret = -EINVAL;
> +		goto out;
> +	}
> +
> +	if (!resp.bar_addr ||
> +	    resp.bar_size != ATH11K_QMI_DEVICE_BAR_SIZE) {
> +		ath11k_warn(ab, "qmi device info invalid addr and size, result: %d, err: %d\n",
> +			    resp.resp.result, resp.resp.error);
> +		ret = -EINVAL;
> +		goto out;
> +	}
> +
> +	bar_addr_va = devm_ioremap(ab->dev, resp.bar_addr, resp.bar_size);
> +
> +	if (!bar_addr_va) {
> +		ath11k_warn(ab, "qmi device info ioremap failed\n");
> +		ab->mem_len = 0;
> +		ret = -EIO;
> +		goto out;
> +	}
> +
> +	ab->mem = bar_addr_va;
> +	ab->mem_len = resp.bar_size;
> +
> +	return 0;
> +out:
> +	return ret;
> +}

In the pending branch I changed the warning messages to follow the style
used in ath11k.

> +
>  static int ath11k_qmi_request_target_cap(struct ath11k_base *ab)
>  {
>  	struct qmi_wlanfw_cap_req_msg_v01 req;
> @@ -2749,6 +2886,12 @@ static int ath11k_qmi_event_load_bdf(struct ath11k_qmi *qmi)
>  		return ret;
>  	}
>  
> +	ret = ath11k_qmi_request_device_info(ab);
> +	if (ret < 0) {
> +		ath11k_warn(ab, "failed to request qmi device info %d\n", ret);
> +		return ret;
> +	}

Here too.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
