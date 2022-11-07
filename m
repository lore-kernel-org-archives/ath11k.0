Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADFFBC433FE
	for <ath11k@archiver.kernel.org>; Mon,  7 Nov 2022 17:35:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=p7FpEGAqYCReKJwiANwUyXndqWLgfGat8whuJ6tTR/E=; b=VjOQJkmVNwt6JY
	HGoTRLkaAeGNJ1+DcE7rWF07S2oIweDggC84hxTgwqyEZOUyDYErlSls9/UmOphqvXCXi3qo1sc2X
	uROKd+NRd9m1S9g3S0wIJjdA/OYGo6t/86ObFMIy2DUnUf4V/KCUdJ9HReFUZygmSZxVi8Y01YxsV
	FuqVMZCbL+VIbDUwxXnrl9XqJbAv9zvVgihEJfRiJaIwGj8ycFgmvvN0281l9ALmUeN3hVTQnlk3R
	20iaf1kGqKaSBTwfuAUa7wjLz7Xl1qoFr4Ek2P0iZwF8UMdeaNHh+xtw7nIG6HCSHzCHbkStsBCnR
	VE2qbgd3uGFUnm7gXcRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1os61j-00Gj4x-3c; Mon, 07 Nov 2022 17:35:15 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1os61g-00Gj26-KI
	for ath11k@lists.infradead.org; Mon, 07 Nov 2022 17:35:14 +0000
Received: by mail-lf1-x132.google.com with SMTP id p8so17706705lfu.11
        for <ath11k@lists.infradead.org>; Mon, 07 Nov 2022 09:35:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2vBV15/t75rMwmc5x5QmAZ8tvqjlJL8SG6UbJno1k6k=;
        b=eKf2NTY8glHETLli+gjYNG+IL7W9ro7LFV1OPSmNRquYMgpRtorVcFqvCMK6rfgWAs
         cF6QvwJC1qhgA6LiF45tB12iNeE+ZX0qgEVYC74n0t9+FbB0YDPFe74JOy4cLjGKERdF
         GSbeGl7gTWXX8YH8SOEvG4oEVe40EX3D9qUn8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2vBV15/t75rMwmc5x5QmAZ8tvqjlJL8SG6UbJno1k6k=;
        b=hHxX9Rr0YArjtra4uLXaeycL94hpZ8+pmRxuOyEC8/dus+rPcMN1knLGgyjHW+G6pz
         OtLEK6JxPRaB2XjH4NkEIF838eFAWwak5WfOgW0Clm9p/UHztsdt9yWFM2rCDksVTYlq
         4OiSXXBaskZT85Fc25kB6+AFsvxRoR22kniHEyw6VmyCXshRflzWqQTqqjal8I33byze
         tBFBaqFvM+ad+7m4YWXCkH7D+ebILgjTqv8AC8MD3SW813e1Gq48cHNE33rF//yFerNx
         oxkgLzLPXrHYAUzPvN+Ki4rQnS9CUaw1FYVs0mjjISMIqDkD1MlvRHtyvNgYZYk/5KsM
         sbJg==
X-Gm-Message-State: ACrzQf15rEgodDvOBtHizWXMpMeogv/+ryNosZhOmjMDite9OErAQ9fd
	FcPcCyYgkBNZLMTd5LjODon2KVTcueNe1ISNtLwxFQ==
X-Google-Smtp-Source: AMsMyM7peMcJhcxlagtzkci1EPQ3TVIfAF1dZ2y0sH/gOy81Qea1b0adzI4yu1Ty8KXCcPs0CqJkhVw/hwKwbbPcUs0=
X-Received: by 2002:ac2:52af:0:b0:4a9:d072:f5c4 with SMTP id
 r15-20020ac252af000000b004a9d072f5c4mr390873lfm.82.1667842506322; Mon, 07 Nov
 2022 09:35:06 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 7 Nov 2022 09:35:05 -0800
MIME-Version: 1.0
In-Reply-To: <20221104082828.14386-1-quic_youghand@quicinc.com>
References: <20221104082828.14386-1-quic_youghand@quicinc.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Mon, 7 Nov 2022 09:35:05 -0800
Message-ID: <CAE-0n5260hssngqWE6j4A_YK0Rq_OSnscpkyVTTiPEMEDz6AGg@mail.gmail.com>
Subject: Re: [PATCH v2] wifi: ath10k: Add WLAN firmware image version info
 into smem
To: Youghandhar Chintala <quic_youghand@quicinc.com>, ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, 
	quic_mpubbise@quicinc.com, linux-arm-msm@vger.kernel.org, 
	kernel test robot <lkp@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221107_093512_696507_53BB2A62 
X-CRM114-Status: GOOD (  21.49  )
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

Quoting Youghandhar Chintala (2022-11-04 01:28:28)
> In a SoC based solution, it would be useful to know the versions of the
> various binary firmware blobs the system is running on. On a QCOM based
> SoC, this info can be obtained from socinfo debugfs infrastructure. For
> this to work, respective subsystem drivers have to export the firmware
> version information to an SMEM based version information table.
>
> Having firmware version information at one place will help quickly
> figure out the firmware versions of various subsystems on the device
> instead of going through builds/logs in an event of a system crash.
>
> Fill WLAN firmware version information in SMEM version table to be
> printed as part of socinfo debugfs infrastructure on a Qualcomm based
> SoC.
>
> This change is applicable only for WCN399X targets.
>
> Reported-by: kernel test robot <lkp@intel.com>
>
> Tested-on: WCN3990 hw1.0 SNOC WLAN.HL.3.2.2.c10-00754-QCAHLSWMTPL-1
>
> Signed-off-by: Youghandhar Chintala <quic_youghand@quicinc.com>

The trailers go together, no blank lines between them.

>
> ---
> Changes from v1:
>  - Changed print format specifier to %zu from %i
>  - Changed ath10k_qmi_add_wlan_ver_smem() API argument
>           to const char *fw_build_id from char *fw_build_id
>  - Changed version_string_size with MACRO
> ---
>  drivers/net/wireless/ath/ath10k/qmi.c | 28 +++++++++++++++++++++++++++
>  1 file changed, 28 insertions(+)
>
> diff --git a/drivers/net/wireless/ath/ath10k/qmi.c b/drivers/net/wireless/ath/ath10k/qmi.c
> index 66cb7a1e628a..928d78f6d494 100644
> --- a/drivers/net/wireless/ath/ath10k/qmi.c
> +++ b/drivers/net/wireless/ath/ath10k/qmi.c
> @@ -14,6 +14,7 @@
>  #include <linux/net.h>
>  #include <linux/platform_device.h>
>  #include <linux/qcom_scm.h>
> +#include <linux/soc/qcom/smem.h>
>  #include <linux/string.h>
>  #include <net/sock.h>
>
> @@ -22,6 +23,8 @@
>
>  #define ATH10K_QMI_CLIENT_ID           0x4b4e454c
>  #define ATH10K_QMI_TIMEOUT             30
> +#define ATH10K_SMEM_IMAGE_VERSION_TABLE       469
> +#define ATH10K_SMEM_IMAGE_TABLE_CNSS_INDEX     13
>
>  static int ath10k_qmi_map_msa_permission(struct ath10k_qmi *qmi,
>                                          struct ath10k_msa_mem_info *mem_info)
> @@ -536,6 +539,29 @@ int ath10k_qmi_wlan_disable(struct ath10k *ar)
>         return ath10k_qmi_mode_send_sync_msg(ar, QMI_WLFW_OFF_V01);
>  }
>
> +static void ath10k_qmi_add_wlan_ver_smem(struct ath10k *ar, const char *fw_build_id)
> +{
> +       u8 *smem_table_ptr;
> +       size_t smem_block_size;
> +       const u32 version_string_size = MAX_BUILD_ID_LEN;

Why not make this size_t as well so the type is the same for the
comparison with smem_block_size?

> +       const u32 smem_img_idx_wlan = ATH10K_SMEM_IMAGE_TABLE_CNSS_INDEX * 128;

> +
> +       smem_table_ptr = qcom_smem_get(QCOM_SMEM_HOST_ANY,
> +                                      ATH10K_SMEM_IMAGE_VERSION_TABLE,
> +                                      &smem_block_size);
> +       if (IS_ERR(smem_table_ptr)) {
> +               ath10k_dbg(ar, ATH10K_DBG_QMI, "smem image version table not found");

Is this missing a newline?

> +               return;
> +       }
> +       if (smem_img_idx_wlan + version_string_size > smem_block_size) {
> +               ath10k_dbg(ar, ATH10K_DBG_QMI, "smem block size too small: %zu",

Same newline question.

> +                          smem_block_size);
> +               return;
> +       }
> +       memcpy(smem_table_ptr + smem_img_idx_wlan, fw_build_id,

Is it a string? Does it need to be NUL terminated? Should this use some
sort of strcpy()? Does the comparison above need to leave a space for
the NUL terminator?

> +              version_string_size);
> +}
> +
>  static int ath10k_qmi_cap_send_sync_msg(struct ath10k_qmi *qmi)
>  {
>         struct wlfw_cap_resp_msg_v01 *resp;

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
