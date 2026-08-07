Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0F84C2A09B
	for <ath11k@archiver.kernel.org>; Fri,  7 Aug 2026 15:34:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gIddRI6I3UgdaoHJWoQKU79TFFjI8K9m8AKLiWVwC58=; b=Icz/S6fL/qHg0MgFIM2nvswtct
	zDBPF7ALdNNjjr4Xb+UGFZB2/8cyXuC0ohwwEim9/Jt9VcwN9AnbWM6b3bpmrn2cc8zDvArHIQSIG
	utLMXkKTIOXADRtWSSeLd9qm9zjyUPnPP8iMI250MCR+jHhAb3lskafDoW489eOReDBuSZcfSPFei
	pqQYsMg2KpdWwhRk+hCxlzeUQDWcLZ2B3Eh+Im/7yFdJgH2UtTq+yliuo0NgWCB9UPY2XY2/g58tQ
	ZAX3jSLwPFJtZZUhgGIH/TDt98VxN0INkm5BoM4sSdotD+dodK9ThHCLPfiImNbuIXKUXtShWXX7S
	XVMsvDOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsMaj-00000008LYB-243W;
	Fri, 07 Aug 2026 15:34:37 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsMah-00000008LXd-0ceG
	for ath11k@lists.infradead.org;
	Fri, 07 Aug 2026 15:34:36 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 677FRYAk1095679
	for <ath11k@lists.infradead.org>; Fri, 7 Aug 2026 15:34:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gIddRI6I3UgdaoHJWoQKU79TFFjI8K9m8AKLiWVwC58=; b=g/z7B60qvKSVVrtj
	Xr+tP9DYF+lHZ47l3knGGj5bdffPA0sXig23RGMplZeIigLBwcZCABpHOl1Hdf2w
	h6VSEDG/JYxFmRyi5q3lN6k2mFlH6YV4Z23Dmjvm1TuIRAy2A3LBbd1lSC5r9p4b
	8rPWr2+BIxMC6GUTHhh7h/s9N0JKkHe1KQl0PmxIxFJe8E4He6yGMk5GA64VknZD
	z7sDgMuPIV0BKOcPuRZKjsv/G0ltxR+ZlGzrRfNw2z4pmogxamQhFnz4El/J0gsp
	ZEbKEJ0QoqVW6uMJne3+NTG+XnXmBmWROMe1CWii6crEjPU6inyV7mDTfD9Mmi3k
	mPg4oQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fwgem8fr5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Fri, 07 Aug 2026 15:34:33 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cb74d5db64eso3851440a12.2
        for <ath11k@lists.infradead.org>; Fri, 07 Aug 2026 08:34:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786116872; x=1786721672; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=gIddRI6I3UgdaoHJWoQKU79TFFjI8K9m8AKLiWVwC58=;
        b=kWMSZxHSWnvI6shHQr0oytZWg5Atux7jSvQ4JtYZKv5Q/8ONxuhUZDFJUhrjhBm1j2
         gzaOkyPirlGkDN80pgIncOA3/jJN7SO3T8yIiWkG4SixnK483ftV/vE9QgUVKaJOaefG
         Aubo55RP2tVhwdsC1nqRv4+xjwdNcxkBlvJ0Gypdu8bphAGK/vrv0ZlShs6bL163cj+G
         SWbMxEXqNgIcpPqvQ9/CGq8gw/FQo1SChO/LuT1SIOx97XrKy5g25DMvk28Syk14GN2s
         H0f2lNHMvDkwCIS1JI/LhOSNsvOXNcmlD75ePZhpsNkjtFp4c9CfOtbXBh37Vp/rVfO8
         wqYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786116872; x=1786721672;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gIddRI6I3UgdaoHJWoQKU79TFFjI8K9m8AKLiWVwC58=;
        b=kyrT3rmk2X9oNJWB9T4dlN36z6kmLS241DGpw4ikuEIBDQSa6qjw3+HDax8CZr01wd
         az1ZMnxxYnmZVILIsD3M90YWqd3F/9sRdlJpl3xPnZQoHY2VNbmaV8unGCuEiPQNW56q
         PPTGvEAle0vl9AsFcHn+jC1iKwvGOCbCnGLKAf00n0nCsJYzvOV+WW86+oaa17IaPLgS
         kZVAQVWITw8oTk2Co+jB/jodFvlH9NbKdsW+6EVBY03pUiS48jihVPQlMo5p3OPScAqj
         ueXzAHTajBuDJaoRvp7wdGio2vghmzeqX8BvWthiTPHwfqnc9ELKdeiSqZpq0lwixT7X
         adfQ==
X-Forwarded-Encrypted: i=1; AHgh+RqAtDsjfP7AIeEqIJouET4w8Jkmj+a1CzS/WNGtLETChi5eVK2YSxRARUOWQ/FWLYRSlzbUAMw=@lists.infradead.org
X-Gm-Message-State: AOJu0YwcSEBS0+2FPmC0apODcy0u2ePKPaF9lY7UpocW566Yn6yqogYR
	BUEbYplKWNYmLx6ghQwVFT1v9wql6MJAfNSLf8UgVWd627I7bw6ZGk2i5MLCXfx5hxemRAjYfMA
	vzLDA2XwKcsbfLBOoIbu73yiIWyV6ht1TvpFICh4dWHgq5Dzl4tR0p0/VzT+B0bwt
X-Gm-Gg: AR+sD11OQ2PC1Ak9jGjNb0Cx/2LiPMc8TtdS1FEz1I5wpclKEStNEJciSsq27KyPt2V
	wLtIlj5TXRV43+tz19fzNtBAYruxaawmDFXPOmHFEDsYnMjU1LS/X74AEse0F+NSSSVzvzxvxMJ
	JMO232EXiYgSiQA3k3T1tyDvey90OhcjVRurP58aznBjOuwd63iurh8aszba4KNdmNIoZCVGWTv
	KLdyxPvmWMcjIH71beUbIchi16WSyvTOqwS9+rIXQEyMJm48nztriA89BE4HsQy17+NnO5EIiE2
	EPIM716fJCYUybkqPiTB9lFoLHfe9qn1nMFRg07RtAIN2xpN8J/m9qyMhYsZ00smdE/KAggtP+C
	tNI0+7KBowqpiYSTuqMq+QcCE11qBzj15Jwn0u6n5zsB9STgZIZbVbI4SjDAR
X-Received: by 2002:a05:6a21:1193:b0:3c3:7fa2:9618 with SMTP id adf61e73a8af0-3cbce9e8db5mr1615457637.37.1786116870546;
        Fri, 07 Aug 2026 08:34:30 -0700 (PDT)
X-Received: by 2002:a05:6a21:1193:b0:3c3:7fa2:9618 with SMTP id adf61e73a8af0-3cbce9e8db5mr1615381637.37.1786116869996;
        Fri, 07 Aug 2026 08:34:29 -0700 (PDT)
Received: from [192.168.1.20] (103.sub-97-215-187.myvzw.com. [97.215.187.103])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-315bec29672sm9015596eec.29.2026.08.07.08.34.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Aug 2026 08:34:29 -0700 (PDT)
Message-ID: <79444a54-8500-43df-b0c6-f6a98c230dea@oss.qualcomm.com>
Date: Fri, 7 Aug 2026 08:34:27 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath11k: run ahb shutdown() teardown only on WCN6750
To: =?UTF-8?Q?Andr=C3=A9_Valentin?= <avalentin@marcant.net>,
        Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        Kalle Valo <kvalo@kernel.org>, stable@vger.kernel.org,
        Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
References: <20260807094858.1548216-1-avalentin@marcant.net>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260807094858.1548216-1-avalentin@marcant.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: j4TBleHlOEIv8RL54orfB4e1eOnO3iHA
X-Proofpoint-GUID: j4TBleHlOEIv8RL54orfB4e1eOnO3iHA
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA3MDExOSBTYWx0ZWRfX0TrqXedYr+JL
 cQkj/kBDs7eQMvMuZWfoYqeDlkaR3NMFm3kZ7YKzk+N2i2q+cdKLTNKXynobCrzkHbeerkGASoX
 G0es954TCw3TDlj1HYfZuiBKg3DMgxE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA3MDExOSBTYWx0ZWRfX5EFxKFH3HM0R
 w035sFljEAU8aNVUqd05GLuwnk6zAMKuyq8qtunE/Y5d3VYWRzbSnSD7NmbbSYvF2tiCSdLFk+f
 0GEH+vYijYOdFhShtGcY9WI8TUO4qwRbNghEjRPsq2q/lnzqx5RY5iGK3klf6tYpBAiZ2FGHx3/
 edViifpXxumSP+aAwd0MmxKSQFOW7JalzwCXnvJguHdrcKlMoHmKVqykgkCvV5YpVGS6p3YfuXK
 oj8mD6p3YG4sOFJmP/gltaAmFxRXhMafYgiYxepLL+itpV+UnD80ryxp5vgjYAMXFfBA2mmpdYB
 QFTAaSvbGUYaADUGL6ZnkgPV2W9cRrzWWMC1pTCyvh2ut5D4zrGdoNr0GeSHbLyFsWgfHBdwXKD
 R5yNb2mKiHCeWwTDXwAnbFuxpPEZt7LncahlqjwxCcX5YI+5yuIQBMFPxCHU6DcW3QMkF55TC5K
 /NwqcTbAndanLUkVAhw==
X-Authority-Analysis: v=2.4 cv=X9Ni7mTe c=1 sm=1 tr=0 ts=6a75fb09 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=UaEkX0D7FlC0tWE/LoNF7Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=7bAZdoCWAAAA:8 a=AjWrOC-rRSFRPpuMgMEA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
 a=TjNXssC_j7lpFel5tvFf:22 a=7DsIbQzYVz3x35o7bboS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-07_02,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 phishscore=0 malwarescore=0 priorityscore=1501
 lowpriorityscore=0 spamscore=0 impostorscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608070119
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260807_083435_348743_D1DFDEB8 
X-CRM114-Status: GOOD (  27.18  )
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

On 8/7/2026 2:48 AM, André Valentin wrote:
> The AHB shutdown() callback was introduced solely for WCN6750, which has
> to stop DMA before the SMMU is torn down at system reboot/shutdown. It
> was registered unconditionally in the shared ath11k_ahb_driver, so it also
> runs on the IPQ AHB targets (IPQ8074/IPQ6018/IPQ5018), which never had a
> shutdown() handler before and have no such SMMU requirement.
> 
> On IPQ6018 the shutdown teardown stops the WCSS Q6 remote processor
> firmware. Stopping the Q6 firmware leaves shared WCSS state such that the
> boot ROM (SBL1) hangs during DDR training on the following warm reset;
> only a cold (power-on) reset recovers. A plain reboot therefore never
> comes back and needs a physical power cycle.
> 
> This was pinned by bisecting the teardown at reboot: skipping
> ath11k_qmi_firmware_stop() (i.e. not stopping the Q6) is what lets the
> warm reset train DDR and boot normally, whereas none of the q6v5 power,
> reset or clock steps reproduce it on their own.
> 
> Restrict the shutdown() teardown to WCN6750, restoring the pre-regression
> behaviour for the IPQ AHB targets. On reboot/shutdown the whole SoC is
> reset by the boot chain, which re-initializes the WCSS from scratch, so no
> teardown is needed there. Module removal (rmmod / remove()) is unchanged.
> 
> Verified on a MikroTik Chateau 5G R17 ax (IPQ6018): before, a plain reboot
> froze in SBL1 at "sbl1_ddr_set_params"; after, SBL1 reaches "SBL1, End",
> trains DDR and boots the kernel across repeated reboots.
> 
> Fixes: ac41c2b642b1 ("wifi: ath11k: Register shutdown handler for WCN6750")
> Cc: stable@vger.kernel.org
> Cc: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
> Signed-off-by: André Valentin <avalentin@marcant.net>
> ---
>  drivers/net/wireless/ath/ath11k/ahb.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/drivers/net/wireless/ath/ath11k/ahb.c b/drivers/net/wireless/ath/ath11k/ahb.c
> index 1e1dea4..749d8bf 100644
> --- a/drivers/net/wireless/ath/ath11k/ahb.c
> +++ b/drivers/net/wireless/ath/ath11k/ahb.c
> @@ -1288,6 +1288,18 @@ static void ath11k_ahb_shutdown(struct platform_device *pdev)
>  	 * remove() is invoked during rmmod & shutdown() during
>  	 * system reboot/shutdown.
>  	 */
> +
> +	/* The shutdown() callback was added for WCN6750, which has to stop DMA
> +	 * before the SMMU is torn down. The other AHB targets (IPQ8074/IPQ6018/
> +	 * IPQ5018) have no such requirement, and running the teardown here stops
> +	 * the WCSS Q6 firmware, which leaves shared state that hangs the boot ROM
> +	 * (SBL1) during DDR training on the following warm reset -- only a cold
> +	 * (power-on) reset recovers. Skip it on those targets; the SoC reset
> +	 * re-initializes the WCSS from scratch.
> +	 */
> +	if (ab->hw_rev != ATH11K_HW_WCN6750_HW10)
> +		return;

this is not the correct approach per the driver architecture.
all hardware-specific operations should be driven via the hw_params structure.

/jeff

