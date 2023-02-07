Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCFFAC636CD
	for <ath11k@archiver.kernel.org>; Tue,  7 Feb 2023 10:37:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uRuYkx/9NjvTvb2zfWQQ6ZAzgkCAZIT8jfInMrvrKa8=; b=aZU8ZCkvh07Hvj
	p46ZLZucX69lBP96/SQq4WLz6QUpvLXU+N+yWSX+Y79XI0aahIHNqTndTfeb4l5R4xmM1WtalEryd
	LytrWi7GKxFYv8KIJojhYzZ0Wfl27iULNb3n0DQ4seRWW3Ad/sTMj/Mxr6sqRFB1dteeEP6s7GdH5
	+6+BI9AdvE5PpXk8jSuXulQyccdZIs7NX04QEfXZ8fDvEKcSUSAxsZ913/G0NAm+WsmnxdpPvNba5
	aTnD+R9rIPfc2mDGmV557iQj8BXFLJNy2exbKXrMlxU2Pfo7DRPkIiaR//GztreiTLUeYpziBleHS
	Pyn9c9H8jW+uykw5x0Hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPLMI-00BkU0-8Z; Tue, 07 Feb 2023 10:37:54 +0000
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPLMF-00BkRV-Nc
	for ath11k@lists.infradead.org; Tue, 07 Feb 2023 10:37:53 +0000
Received: by mail-pg1-x52d.google.com with SMTP id a23so10124948pga.13
        for <ath11k@lists.infradead.org>; Tue, 07 Feb 2023 02:37:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=jLh9pEVrRCrNudQh0YY993IrWd2qZxs35VLB+sjiW8Q=;
        b=gbofRDFYEVoX+XklzMQeWEvjHnnc6Y9axDfL3ISYpqray65HFFngOOBGnKC/ZO9nUT
         QyYyvBHpRHubhD+9+YCBw/g+o8uSQNb6pfKIQSS/klrcnRXYAMxEXdnmnoF0aLdV34YS
         KN0R6J3tHfne8rdlfR8Tqifok01q3JoynzW+lw0SwY7wxjKyn8mt/NiWxzdRSmD9YJGi
         N1QVlSoYJjXfeBxxQUrC1yl6Q1sjxnWzT1a6TBzD10sAFSuemKIhaaUuNhIKbuklv+4E
         mPdBagUICGqeRUra8iu/8NUukHpnFlFDlWd6kMH5ibpohgWIFvT8FjZQSn4yNJryfDkN
         YoUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jLh9pEVrRCrNudQh0YY993IrWd2qZxs35VLB+sjiW8Q=;
        b=u9ZtggxdvOg1vBuQvTUqVVkAP2bkMWe3bYleFGh0bgAMxwXJPFt2aW0Udjuv56J9g0
         TzDF0At5plEx+EZpfhWrEbwyIrT9JKaaxiCxuhJPrWRKNIiWu0Z0gcpTCalAnT+aFDSP
         kkZ/C1B8hpPABhlCyd/+Kf6Dm4hi3kuMeCn8e+H6t3aRQiqC1a9kYsHi2IWDujpHel5M
         yimBH6M/ETcbrITEzbMQmq/SGp4aQ2A8gF7vKS3GMhIJAzYeprNYeD2A0VqUvzv7/J17
         iFpiPzNy2qE2jcXLURqjs66AYQPzRGRpiMc2msctFIovprnhGqOK0a1HUw7QS1dDULiI
         FRyw==
X-Gm-Message-State: AO0yUKVNy6V3NF5olZMAls43QIUieEx+qZPq82YlvbD4GjIkFi/iHlfL
	3/XYkmZyjVceouh5O+6nd4bUMEvFO2GE4YmKHppg7Q==
X-Google-Smtp-Source: AK7set/yvpTNpygND1JZcdOTmd7gU6Z2SnqIvdZ3UlYgqI16MYWRblxUFMhpDU3/H1AaaYGaCi3dANjJrxpfc83xzJ0=
X-Received: by 2002:a63:9550:0:b0:4db:99fb:e855 with SMTP id
 t16-20020a639550000000b004db99fbe855mr435594pgn.42.1675766267461; Tue, 07 Feb
 2023 02:37:47 -0800 (PST)
MIME-Version: 1.0
References: <20230207103207.759-1-quic_youghand@quicinc.com> <20230207103207.759-4-quic_youghand@quicinc.com>
In-Reply-To: <20230207103207.759-4-quic_youghand@quicinc.com>
From: Robert Marko <robert.marko@sartura.hr>
Date: Tue, 7 Feb 2023 11:37:36 +0100
Message-ID: <CA+HBbNFQ9N3cZyPoP6i7HSate181_6TREPss_UD7RX1746sVXA@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] wifi: ath11k: PMIC XO cal data support
To: Youghandhar Chintala <quic_youghand@quicinc.com>
Cc: kvalo@kernel.org, davem@davemloft.net, edumazet@google.com, 
	kuba@kernel.org, pabeni@redhat.com, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, ath11k@lists.infradead.org, 
	linux-wireless@vger.kernel.org, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230207_023751_798557_10C239D7 
X-CRM114-Status: GOOD (  25.88  )
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

On Tue, Feb 7, 2023 at 11:33 AM Youghandhar Chintala
<quic_youghand@quicinc.com> wrote:
>
> PMIC XO is the clock source for Wi-Fi RF clock in integrated Wi-Fi
> chipset ex: WCN6750. Due to board layout errors XO frequency drifts
> can cause Wi-Fi RF clock inaccuracy.
> XO calibration test tree in Factory Test Mode is used to find the
> best frequency offset(for example +/-2 KHz )by programming XO trim
> register. This ensure system clock stays within required 20 ppm
> WLAN RF clock.
>
> Retrieve the XO trim offset via system firmware (e.g., device tree),
> especially in the case where the device doesn't have a useful EEPROM
> on which to store the calibrated XO offset (e.g., for integrated Wi-Fi).
> Calibrated XO offset is sent to firmware, which compensate the clock drift
> by programing the XO trim register.

This is still a bit too vague for me and the DT binding is allowing
for pretty much
anything to be passed.

This XO trim offset is offset from which register base?
And, what is supposed to populate it?

Regards,
Robert
>
> Tested-on: WCN6750 hw1.0 AHB WLAN.MSL.1.0.1-00887-QCAMSLSWPLZ-1
>
> Signed-off-by: Youghandhar Chintala <quic_youghand@quicinc.com>
> ---
>  drivers/net/wireless/ath/ath11k/ahb.c  |  8 ++++++++
>  drivers/net/wireless/ath/ath11k/core.h |  3 +++
>  drivers/net/wireless/ath/ath11k/qmi.c  | 24 ++++++++++++++++++++++++
>  drivers/net/wireless/ath/ath11k/qmi.h  |  4 +++-
>  4 files changed, 38 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/net/wireless/ath/ath11k/ahb.c b/drivers/net/wireless/ath/ath11k/ahb.c
> index d34a4d6325b2..89580b4e47a9 100644
> --- a/drivers/net/wireless/ath/ath11k/ahb.c
> +++ b/drivers/net/wireless/ath/ath11k/ahb.c
> @@ -1039,6 +1039,14 @@ static int ath11k_ahb_fw_resources_init(struct ath11k_base *ab)
>         ab_ahb->fw.iommu_domain = iommu_dom;
>         of_node_put(node);
>
> +       ret = of_property_read_u32(pdev->dev.of_node, "xo-cal-data", &ab->xo_cal_data);
> +       if (ret) {
> +               ath11k_dbg(ab, ATH11K_DBG_AHB, "failed to get xo-cal-data property\n");
> +               return 0;
> +       }
> +       ab->xo_cal_supported = true;
> +       ath11k_dbg(ab, ATH11K_DBG_AHB, "xo cal data 0x%x\n", ab->xo_cal_data);
> +
>         return 0;
>
>  err_iommu_unmap:
> diff --git a/drivers/net/wireless/ath/ath11k/core.h b/drivers/net/wireless/ath/ath11k/core.h
> index 22460b0abf03..783398e98915 100644
> --- a/drivers/net/wireless/ath/ath11k/core.h
> +++ b/drivers/net/wireless/ath/ath11k/core.h
> @@ -969,6 +969,9 @@ struct ath11k_base {
>                 const struct ath11k_pci_ops *ops;
>         } pci;
>
> +       bool xo_cal_supported;
> +       u32 xo_cal_data;
> +
>         /* must be last */
>         u8 drv_priv[] __aligned(sizeof(void *));
>  };
> diff --git a/drivers/net/wireless/ath/ath11k/qmi.c b/drivers/net/wireless/ath/ath11k/qmi.c
> index 145f20a681bd..67f386b001ab 100644
> --- a/drivers/net/wireless/ath/ath11k/qmi.c
> +++ b/drivers/net/wireless/ath/ath11k/qmi.c
> @@ -1451,6 +1451,24 @@ static struct qmi_elem_info qmi_wlanfw_wlan_mode_req_msg_v01_ei[] = {
>                 .offset         = offsetof(struct qmi_wlanfw_wlan_mode_req_msg_v01,
>                                            hw_debug),
>         },
> +       {
> +               .data_type  = QMI_OPT_FLAG,
> +               .elem_len   = 1,
> +               .elem_size  = sizeof(u8),
> +               .array_type = NO_ARRAY,
> +               .tlv_type   = 0x11,
> +               .offset     = offsetof(struct qmi_wlanfw_wlan_mode_req_msg_v01,
> +                                      xo_cal_data_valid),
> +       },
> +       {
> +               .data_type  = QMI_UNSIGNED_1_BYTE,
> +               .elem_len   = 1,
> +               .elem_size  = sizeof(u8),
> +               .array_type = NO_ARRAY,
> +               .tlv_type   = 0x11,
> +               .offset     = offsetof(struct qmi_wlanfw_wlan_mode_req_msg_v01,
> +                                      xo_cal_data),
> +       },
>         {
>                 .data_type      = QMI_EOTI,
>                 .array_type     = NO_ARRAY,
> @@ -2610,6 +2628,12 @@ static int ath11k_qmi_wlanfw_mode_send(struct ath11k_base *ab,
>         req.hw_debug_valid = 1;
>         req.hw_debug = 0;
>
> +       if (ab->xo_cal_supported) {
> +               req.xo_cal_data_valid = 1;
> +               req.xo_cal_data = ab->xo_cal_data;
> +       }
> +       ath11k_dbg(ab, ATH11K_DBG_QMI, "xo_cal_supported %d\n", ab->xo_cal_supported);
> +
>         ret = qmi_txn_init(&ab->qmi.handle, &txn,
>                            qmi_wlanfw_wlan_mode_resp_msg_v01_ei, &resp);
>         if (ret < 0)
> diff --git a/drivers/net/wireless/ath/ath11k/qmi.h b/drivers/net/wireless/ath/ath11k/qmi.h
> index 2ec56a34fa81..db61ce0d5689 100644
> --- a/drivers/net/wireless/ath/ath11k/qmi.h
> +++ b/drivers/net/wireless/ath/ath11k/qmi.h
> @@ -450,7 +450,7 @@ struct qmi_wlanfw_m3_info_resp_msg_v01 {
>         struct qmi_response_type_v01 resp;
>  };
>
> -#define QMI_WLANFW_WLAN_MODE_REQ_MSG_V01_MAX_LEN       11
> +#define QMI_WLANFW_WLAN_MODE_REQ_MSG_V01_MAX_LEN       17
>  #define QMI_WLANFW_WLAN_MODE_RESP_MSG_V01_MAX_LEN      7
>  #define QMI_WLANFW_WLAN_CFG_REQ_MSG_V01_MAX_LEN                803
>  #define QMI_WLANFW_WLAN_CFG_RESP_MSG_V01_MAX_LEN       7
> @@ -470,6 +470,8 @@ struct qmi_wlanfw_wlan_mode_req_msg_v01 {
>         u32 mode;
>         u8 hw_debug_valid;
>         u8 hw_debug;
> +       u8 xo_cal_data_valid;
> +       u8 xo_cal_data;
>  };
>
>  struct qmi_wlanfw_wlan_mode_resp_msg_v01 {
> --
> 2.38.0
>
>
> --
> ath11k mailing list
> ath11k@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/ath11k



-- 
Robert Marko
Staff Embedded Linux Engineer
Sartura Ltd.
Lendavska ulica 16a
10000 Zagreb, Croatia
Email: robert.marko@sartura.hr
Web: www.sartura.hr

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
