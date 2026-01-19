Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06070D29C3D
	for <ath11k@archiver.kernel.org>; Mon, 19 Jan 2026 15:57:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZFi+VJ96Lx+RhMsznMcBzo/7WtrXEjJe+WbuE10vlzM=; b=UD854mVyrUOV+Ph57S3nUNR2m5
	peKRpK+AYsqFIGkxlJchLx5v3bCCvufqu6PYSX3qmQKE3/B75OXuDNleHzGtrPhsp/1Wfu2dWPm5l
	HXBfKOTEBmnKbl7zfl+ITYPG1VwuzollgKuYOXSsI2e2vCSsPsrMbmmqiugF6p/L3MHkGmR5pzh13
	AS76L/6tVUM/UPtldGMwlDTg6c7WyLCmlLgUiEbjzi8oFM4B9vrDhtF+S+PkpfVoN3jMArqn+v+ws
	L8txfSBhnWodWoNWdTg5qx84oh5vV4f88DZdzC4f5wqdyBtpKgTe3lzB1eSIPnOqJKR52Wj16DPXs
	ue4tHJbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhrce-00000002P2j-1mNd;
	Mon, 19 Jan 2026 15:56:56 +0000
Received: from mail-yw1-x1131.google.com ([2607:f8b0:4864:20::1131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhrcY-00000002P1j-2nEW
	for ath11k@lists.infradead.org;
	Mon, 19 Jan 2026 15:56:55 +0000
Received: by mail-yw1-x1131.google.com with SMTP id 00721157ae682-7927b3e5253so35530587b3.1
        for <ath11k@lists.infradead.org>; Mon, 19 Jan 2026 07:56:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768838207; x=1769443007; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZFi+VJ96Lx+RhMsznMcBzo/7WtrXEjJe+WbuE10vlzM=;
        b=TdebaOdD6FX4jSkqkT6egAhBlkhDATUIBp6cR61BrBJzNEBdXf4QBFXEGCJeUkjSQH
         /sif5DT1ahS1HKmCTBc9+eYKoE8kN7wY40r/rl8uextAtbG14xVdwvGxR9HCIpfnnFm/
         uJp5LHjW0khf4m4eC+VMuu44UHcrTB6y6CDrp9Y7LU/sFoZgGlEc0tAt48659sWstOiA
         aymlrLusqVl5f7YCk7q4iqhs9rI7bIU34WnoCpTQMdy+SpLRBrWZNBVL9V8XonbUAgCi
         1jPdKQV4A7ikBDIOyuhz+bYIaNeJ3SNludY+UpPefPTRozbq8ubfwdDX5+oE2MsT3z2g
         kjEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768838207; x=1769443007;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZFi+VJ96Lx+RhMsznMcBzo/7WtrXEjJe+WbuE10vlzM=;
        b=pdZD/zYRZUXIJG+eAHfBAeoDMZrqhEGi08v3j3DWuJODExOVEcDkQDCADWyr2JbETL
         UzsK0aFgCfGBxEjOBNEIaltZ+C/9+rZteVZaRxpPIQzsJ3FU/gMYIEDpNguMS4ED0QB0
         8kphFZxEj8Dh7GlIXOU2FfGM/0qgw/HPxCg2IQBjubGRmtWtoqTxPb0U6DsUWzOBZfaY
         Eg7x8jBzV4XfvrgU0tSheRRnIAQC2HyWAztqrrN0UmXmJRsa5Jl64PPRZwkFYMfqvUIc
         KJ7L2EePRTXNYfExsXWpA6i2GgtE3nrAE5Qi9JO4ebqT5hNt8PjctaZyc9gkahc/PpSE
         dLmw==
X-Forwarded-Encrypted: i=1; AJvYcCWyfgETEZx1e8sHkTKrUg3n/QoBBLsRoDhSRSMmDzXIn4F/dKsGxSCErID7yf1NyxEwGk9y3/8=@lists.infradead.org
X-Gm-Message-State: AOJu0YzlMYAovmaDY+U7M/R4XdfD/NQ2i9XslfOKx09Si7ObY/cEi7aB
	P7Z0xokxsZXF9B2z5AuVGNxSaQk+lKLHXfGLF1T5AsGmD1po91kWYcIZRMtCNWv+/jo9sVLcfEG
	me1X23U8E3Wtpp/gve54Vc8icaT/JDeg=
X-Gm-Gg: AZuq6aLum7sqUtZFJVQ/PM7v7d8hRyD1vI/NSGmZiivnS9xPGafQY8PWFsGrFZYhOja
	H9Ic3Q21fCQH1+ql/Yg9XSyUl2k673RJoMi8d1sd3I+Bz92oJfV5gMrlVYFCk0zdiy6Dc6E9+sL
	Jk+2cV/Liymp7U385XOyhSwu+SSntboStS+a9v++1DWQoUwluCVEJK+jyBgCcyYOweA6amO/ZGj
	9gs6ejQkrY59vI/24f7CYNx5JuH5SZVmk4EdMLKLPOsLbQZh1L9L+4Wo7Ib2aqTk8U4Vg==
X-Received: by 2002:a05:690c:6d8b:b0:78c:32fc:d3c8 with SMTP id
 00721157ae682-793c54063b1mr84654397b3.61.1768838207073; Mon, 19 Jan 2026
 07:56:47 -0800 (PST)
MIME-Version: 1.0
References: <20260119140238.3360658-1-miaoqing.pan@oss.qualcomm.com> <20260119140238.3360658-2-miaoqing.pan@oss.qualcomm.com>
In-Reply-To: <20260119140238.3360658-2-miaoqing.pan@oss.qualcomm.com>
From: Jonas Gorski <jonas.gorski@gmail.com>
Date: Mon, 19 Jan 2026 16:56:35 +0100
X-Gm-Features: AZwV_QjDpm8QDQgjkrGwqj8CMMa00N7wkcI94H42Z5svJe8pdQ2INMjNC6m63_4
Message-ID: <CAOiHx=nBLtSFNhuRZrHn5z8bCrA5nyuS9G8B0nh-WTiFU_HUMw@mail.gmail.com>
Subject: Re: [PATCH v3 ath-current 1/2] wifi: ath11k: add usecase firmware
 handling based on device compatible
To: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
Cc: jjohnson@kernel.org, johannes@sipsolutions.net, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, ath11k@lists.infradead.org, 
	linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, krzk@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_075653_129670_EB57B664 
X-CRM114-Status: GOOD (  21.21  )
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

Hi,

On Mon, Jan 19, 2026 at 3:04=E2=80=AFPM Miaoqing Pan
<miaoqing.pan@oss.qualcomm.com> wrote:
>
> For M.2 WLAN chips, there is no suitable DTS node to specify the
> firmware-name property. In addition, assigning firmware for the
> M.2 PCIe interface causes chips that do not use usecase specific
> firmware to fail. Therefore, abandoning the approach of specifying
> firmware in DTS. As an alternative, propose a static lookup table
> mapping device compatible to firmware names. Currently, only WCN6855
> HW2.1 requires this.
>
> However, support for the firmware-name property is retained to keep
> the ABI backwards compatible.
>
> For details on usecase specific firmware, see:
> https://lore.kernel.org/all/20250522013444.1301330-3-miaoqing.pan@oss.qua=
lcomm.com/.
>
> Tested-on: WCN6855 hw2.1 PCI WLAN.HSP.1.1-04685-QCAHSPSWPL_V1_V2_SILICONZ=
_IOE-1
>
> Fixes: edbbc647c4f3 ("wifi: ath11k: support usercase-specific firmware ov=
errides")
> Signed-off-by: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
> ---
>  drivers/net/wireless/ath/ath11k/core.c | 36 ++++++++++++++++++++++++++
>  drivers/net/wireless/ath/ath11k/core.h |  4 +++
>  2 files changed, 40 insertions(+)
>
> diff --git a/drivers/net/wireless/ath/ath11k/core.c b/drivers/net/wireles=
s/ath/ath11k/core.c
> index de84906d1b27..1cf7f4e601c3 100644
> --- a/drivers/net/wireless/ath/ath11k/core.c
> +++ b/drivers/net/wireless/ath/ath11k/core.c
> @@ -1044,6 +1044,42 @@ static const struct dmi_system_id ath11k_pm_quirk_=
table[] =3D {
>         {}
>  };
>
> +static const struct __ath11k_core_usecase_firmware_table {
> +       u32 hw_rev;
> +       const char *compatible;
> +       const char *firmware_name;
> +} ath11k_core_usecase_firmware_table[] =3D {
> +       { ATH11K_HW_WCN6855_HW21, "qcom,lemans-evk", "nfa765"},
> +       { ATH11K_HW_WCN6855_HW21, "qcom,monaco-evk", "nfa765"},
> +       { ATH11K_HW_WCN6855_HW21, "qcom,hamoa-iot-evk", "nfa765"},
> +       { /* Sentinel */ }
> +};
> +
> +const char *ath11k_core_get_usecase_firmware(struct ath11k_base *ab)
> +{
> +       struct device_node *root __free(device_node) =3D of_find_node_by_=
path("/");
> +       const struct __ath11k_core_usecase_firmware_table *entry =3D NULL=
;
> +       int i, count =3D of_property_count_strings(root, "compatible");
> +       const char *compatible =3D NULL;
> +
> +       for (i =3D 0; i < count; i++) {
> +               if (of_property_read_string_index(root, "compatible", i,
> +                                                 &compatible) < 0)
> +                       continue;
> +
> +               entry =3D ath11k_core_usecase_firmware_table;
> +               while (entry->compatible) {
> +                       if (ab->hw_rev =3D=3D entry->hw_rev &&
> +                           !strcmp(entry->compatible, compatible))

You should be able to replace most of this code by using
of_machine_is_compatible(entry->compatible) instead.

> +                               return entry->firmware_name;
> +                       entry++;
> +               }
> +       }
> +
> +       return NULL;
> +}
> +EXPORT_SYMBOL(ath11k_core_get_usecase_firmware);
> +
>  void ath11k_fw_stats_pdevs_free(struct list_head *head)
>  {

Best regards,
Jonas

