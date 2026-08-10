Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C479BC5AD55
	for <ath11k@archiver.kernel.org>; Mon, 10 Aug 2026 02:06:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/PxKp6PWvSiSLplxnSx39IQh9eiIjjfLviKP4m50M4I=; b=Qh1vt30Sf/I8xVdfKORwwd4o0n
	99psedw8NzA6Rfo5d+L8NyXOYmjHXBjLLP2vy4ZtDtHLDfEo5VhLeg0WfUjp6abmoKOFFxKccX2l7
	CgHjxblJsWzDsLlEm18l62PI0CdpcXZP3SfZTsybXaKJb9vOybyMuXP+knEmmHVe4RPDGThNy/BSZ
	I26h6PNXBmFDzneNlUAZKUje1U3C1gtMctEM9UyF2+1sxd3BWN/hXNbZJA5HLQlM1Lmmkr2XoLq1r
	7sGvoRf5Lxftmv0Q7AMRp20pXc08YLXgq1brUZprZa4MWrOcopkQpx7d2YF60a+4DoOce7dtEz6ge
	gZcLyjuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtFPa-0000000Atzy-1WlV;
	Mon, 10 Aug 2026 02:06:46 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtFPY-0000000AtzS-12wT
	for ath11k@lists.infradead.org;
	Mon, 10 Aug 2026 02:06:45 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 679L92FS3439292
	for <ath11k@lists.infradead.org>; Mon, 10 Aug 2026 02:06:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/PxKp6PWvSiSLplxnSx39IQh9eiIjjfLviKP4m50M4I=; b=XPpzjKOniF2EFRtC
	Z36ldXsA54iQArrIi6hniej5c9izgwo1l2EKubFAL3SXtUlGnK2tvllDnnGp2oYh
	OdClVHnzsN9BsY1muRd/V2fbUEjnYa33FzU6W8G9bJI5QdbNZzSlFGzdSQaIymoi
	V6hIaWTIyv8egFSA3xkIAwpH8pamRxHH8AzEYDwiHdBCkIx3ARuJPqiQtji+j8Ac
	I5k9OUSYNv/pGt5w8coP4wvKfvsmPCci51y0zAJ7oTK92RXJR0BJzjaaz5a+joFX
	vDmKCMYGNHKfgIljF+KzjBatqqalKuVx63vspKuwWwe4YdaUT81H0VBpGJjCbq/J
	ZUSXaA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fwwr9kvej-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Mon, 10 Aug 2026 02:06:42 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38ec0f510a9so3839144a91.2
        for <ath11k@lists.infradead.org>; Sun, 09 Aug 2026 19:06:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786327601; x=1786932401; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/PxKp6PWvSiSLplxnSx39IQh9eiIjjfLviKP4m50M4I=;
        b=QV1769IkJrE2C6ATNoN3rIE9jush3qs1BMND52heZts2vDG7bFs4mNmSZx5/myDnr2
         OfyfXx76IUV6PCYNgB4HydOvYl6ZMMKRrf6W2FJiUByElssB8AonV4z/sGrGsxyeFgSW
         OFOyCAF4L8jPIwlojPJaMyeifLuEerdqW8wBlwbfT3Zhj1bMH0OIWvAKVSP5FP9BMIEc
         aGHVPPG/CGdoxRkt2af4w6wOWMGahxRQG9OQ7GbOXBKfFG1fSqpGMHDQXpnsu0In/tHG
         kkVzKBdbvs2atraySJ63RsJ+7ZLu4IU1efzGBh7HUqoKunijruLcV+QWCUYAfILtSsqL
         2XGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786327601; x=1786932401;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/PxKp6PWvSiSLplxnSx39IQh9eiIjjfLviKP4m50M4I=;
        b=N5zGMo4pxLkCnkcdd6cpfaRVTIRDeSq00hsIWJyqUbYS4rLEfCu1a6BEgNpW5EhRbc
         ZnmBVVkC/MM9P0Ma6VjjICurUs2i4i/zVXCm16qz+7w9KD7Cu3LqikpbY9SudUsClHwO
         NfGEMMNuXEf6MYIW/RMeyjSk756+JHkFFM5vrqJtXoFP5R8Rj4rSK5DYNKvz9TPPTsGf
         fREWNAkwcLrjif6okvzt3IiRR85l/XqexemSBnYl3CpnpIUqoKixlc3oHYgBM5ii4HwU
         iDI/YnoaQ6maHCzQqQuo2snnnfgXrzytp+zVv884tyAnVDUBfaYMfpl2YLLWcHfqk9BO
         /7ZA==
X-Gm-Message-State: AOJu0Yy/voW+boFr2/GWL84OV5uu2q2JokALma+8Wonuy8L9vRJ3dge2
	jerV/0/+jtgPDl+5Kb+kkoIy3RYA9EJkcH7+VncVtM1QAp66TGP+E5P/PHFdcGeHYHwycq6nD7R
	kFsGDylNAnBrARB7q7z4hNHeITlze7e4Ear2hwKoRFpJ63edR5F8B9y+aKMTIJXa/
X-Gm-Gg: AR+sD10pj7GhHzO+X1HmxvJ5lmXM4BtvXVIIKyWtKyCSzvctVZTOp4jD3IY4D+2Iu65
	D7g1TbcJ4Lf9EMqJDBKH5Ync3uAgK5ur08cBzoJgoixDnjjHA5TwJFCFoHrMpmoL1+jEu2Mp/F7
	opn3cEzwNW3UNTRKVWECzAWpapykERmV15WkWHRij57op0Ncnun96xtM5x995JlyXBn9+6YfmdL
	OFV87MkveZYNpmrMk92o0dYPa4Iy8XYwHeLsqZfmCVp98pfHsyQMOgUoP1DUGXzbMlac2HTDtYj
	COzxKh5atnN5K5cquBzteGLTU0I5UI1hibLJbSvR3mDIPuz3yQPTfw9m8c5NCW140x01WivuInR
	/T3Wald2Uxh9yp1JLWfimOBBapWlzr4oh3a3AOxjUxt4ZJmdpFxBXmZD1+0ct2/n1yIrFC6Ma
X-Received: by 2002:a17:90b:2dc7:b0:380:fead:448d with SMTP id 98e67ed59e1d1-392620e6e25mr22815694a91.13.1786327601470;
        Sun, 09 Aug 2026 19:06:41 -0700 (PDT)
X-Received: by 2002:a17:90b:2dc7:b0:380:fead:448d with SMTP id 98e67ed59e1d1-392620e6e25mr22815634a91.13.1786327601014;
        Sun, 09 Aug 2026 19:06:41 -0700 (PDT)
Received: from [10.133.33.47] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-390b31fc026sm5514327a91.3.2026.08.09.19.06.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 09 Aug 2026 19:06:40 -0700 (PDT)
Message-ID: <83354f8a-9906-48b5-9487-fc00213af5ed@oss.qualcomm.com>
Date: Mon, 10 Aug 2026 10:06:35 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next 1/2] wifi: ath11k: guard copy engine access
 against a cleared srng
To: Julius Bairaktaris <julius@bairaktaris.de>, jjohnson@kernel.org
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        vasanthakumar.thiagarajan@oss.qualcomm.com,
        rameshkumar.sundaram@oss.qualcomm.com
References: <20260805192129.61113-1-julius@bairaktaris.de>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260805192129.61113-1-julius@bairaktaris.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=d73FDxjE c=1 sm=1 tr=0 ts=6a793232 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=clZncOENtWtQyurloiQA:9 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: UV9kvdB9C_TvVKS_ZTjtJtSfBm292iPT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEwMDAxNyBTYWx0ZWRfXzsFKa9j67ne/
 PMCooMpDBI9fDrSgJST5eT6vuSMJc+JFUIT+Da8FxTvFjBClZEmn2730OO/xAMsDAm6URC7Fq2/
 3CXygHw/qQH9gAuoDLbIpXlIBE5cttWfbcTToOs6yV1sgLECCLxPcFQ7hLH6mKbBFbti2E1x3C2
 DhEsYQqpnRhQI4CFLiFnCZ1Hyf9M+Cled+GAKu4nQaMnzSMM72Y2VwUfvZXHPhKSSpjcQOT+hwl
 HNC7avwT5uKGKg0ZRd+AXVB6KPMvsrY7y26jrn9dKGGHmuaQmWYf6cKmRCsdSX/6RfDPxhJhi1e
 zzOsQMpVgAQSMeIIyvjdCJtJDMJjIsMs2hNaTJvGATT4/kbcw4QeZtUj8kVa/lbB6Of7q45J0sT
 Dfaz5w0wFqJmMERGPwLimgtKnbw1ZoOBlRwwEDwtHrZ/eEyIgah+OcTt7UZtCQP7Ykv/tWndm/Y
 9ASv409S+DUPhGHxctQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEwMDAxNyBTYWx0ZWRfX3lGA7sBm3fIQ
 dIfrUrGEiky9DK4OyD0FIzg2S4fR1I1sApcI/3lAWXM7XvLhvDpJr/5vKb837VpiRCs+oZIwm4k
 ovQIuTPXN3kcMzWCVs4kMo6LZAurEG0=
X-Proofpoint-GUID: UV9kvdB9C_TvVKS_ZTjtJtSfBm292iPT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-09_07,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 phishscore=0 adultscore=0 malwarescore=0
 spamscore=0 suspectscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608100017
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260809_190644_395055_57238A9B 
X-CRM114-Status: GOOD (  31.92  )
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



On 8/6/2026 3:21 AM, Julius Bairaktaris wrote:
> ath11k_core_reconfigure_on_crash() zeroes the ring list with
> ath11k_hal_srng_clear() and only rebuilds the copy engine rings later,
> inside ath11k_core_qmi_firmware_ready() -> ath11k_ce_init_pipes().
> 
> ath11k_ce_send() is gated on ATH11K_FLAG_CRASH_FLUSH, but that flag is
> cleared before ath11k_core_qmi_firmware_ready() is called - it has to be,
> since the firmware bring-up itself sends WMI commands through the copy
> engine. For the whole of that bring-up the gate is open while the ring is
> still zeroed, so any WMI command issued in that window dereferences the
> NULL u.src_ring.tp_addr in ath11k_hal_srng_access_begin():
> 
>   Unable to handle kernel read from unreadable memory at virtual address 0
>   CPU: 0 UID: 101 PID: 1846 Comm: hostapd
>   pc : ath11k_hal_srng_access_begin+0xc/0x60 [ath11k]
>   lr : ath11k_ce_send+0x114/0x350 [ath11k]
>   Call trace:
>    ath11k_hal_srng_access_begin+0xc/0x60 [ath11k] (P)
>    ath11k_htc_send+0x188/0x3c8 [ath11k]
>    ath11k_wmi_cmd_send+0xc8/0x2f4 [ath11k]
>    ath11k_wmi_send_peer_create_cmd+0x78/0xe0 [ath11k]
>    ath11k_peer_create+0x138/0x500 [ath11k]
> 
> The caller matters: this is a command issued fresh during the recovery,
> not a task that was already blocked in ath11k_wmi_cmd_send(). A blocked
> one sleeps through the whole window and never re-enters ath11k_ce_send(),
> which is why hammering beacon updates does not reproduce it and a station
> associating during recovery does.
> 
> ath11k_ce_completed_send_next() has no gate at all, and
> ath11k_core_reconfigure_on_crash() calls ath11k_ce_cleanup_pipes() before
> anything else, so a crash arriving after a previous recovery already ran
> ath11k_hal_srng_clear() reaps rings whose tp_addr is NULL. This is a
> different entry into the same dereference from the one fixed by
> commit e8d85672dd7e ("wifi: ath11k: fix NULL pointer dereference in
> ath11k_hal_srng_access_begin"), which stops a successful bring-up from
> being repeated; it does not close this window.
> 
> Test u.src_ring.tp_addr rather than srng->initialized in both places:
> ath11k_hal_srng_setup() publishes ->initialized before ->tp_addr with no
> barrier between them, so an ->initialized check can be true while the
> pointer that is about to be dereferenced is still NULL.
> 
> Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.12-01460-QCAHKSWPL_SILICONZ-1
> 
> Fixes: 32be3ca4cf78 ("wifi: ath11k: HAL SRNG: don't deinitialize and re-initialize again")
> Assisted-by: Claude:claude-opus-5
> Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
> ---
>  drivers/net/wireless/ath/ath11k/ce.c | 24 ++++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
> 
> diff --git a/drivers/net/wireless/ath/ath11k/ce.c b/drivers/net/wireless/ath/ath11k/ce.c
> --- a/drivers/net/wireless/ath/ath11k/ce.c
> +++ b/drivers/net/wireless/ath/ath11k/ce.c
> @@ -472,6 +472,17 @@ static struct sk_buff *ath11k_ce_completed_send_next(struct ath11k_ce_pipe *pipe
> 
>  	spin_lock_bh(&srng->lock);
> 
> +	/*
> +	 * ath11k_ce_cleanup_pipes() can reach this on a ring that
> +	 * ath11k_hal_srng_clear() has zeroed and that recovery has not
> +	 * rebuilt. Bail out as for an empty ring rather than dereference
> +	 * the NULL tp_addr in ath11k_hal_srng_access_begin().
> +	 */
> +	if (unlikely(!srng->u.src_ring.tp_addr)) {
> +		skb = ERR_PTR(-EIO);
> +		goto err_unlock;
> +	}
> +
>  	ath11k_hal_srng_access_begin(ab, srng);
> 
>  	desc = ath11k_hal_srng_src_reap_next(ab, srng);
> @@ -750,6 +761,19 @@ int ath11k_ce_send(struct ath11k_base *ab, struct sk_buff *skb, u8 pipe_id,
> 
>  	srng = &ab->hal.srng_list[pipe->src_ring->hal_ring_id];
> 
> +	/*
> +	 * ATH11K_FLAG_CRASH_FLUSH is cleared before the copy engine rings
> +	 * are rebuilt, so the check above lets a send through while the
> +	 * ring is still zeroed. Test the pointer that would be
> +	 * dereferenced: ath11k_hal_srng_setup() publishes ->initialized
> +	 * before ->tp_addr without a barrier, so ->initialized would still
> +	 * race the rebuild.
> +	 */
> +	if (unlikely(!srng->u.src_ring.tp_addr)) {
> +		spin_unlock_bh(&ab->ce.ce_lock);
> +		return -ESHUTDOWN;
> +	}
> +

I understand this is a real issue but both changes look not a proper fix to me. at least
we should not test hal srng fields at CE layer since that is a layer violation.

>  	spin_lock_bh(&srng->lock);
> 
>  	ath11k_hal_srng_access_begin(ab, srng);


