Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B32FCA5FA5
	for <ath11k@archiver.kernel.org>; Tue, 29 Sep 2026 14:24:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NQntaQMdAv6bwmg1427kVvEeX1pxaOhWQXRF0oq0sCA=; b=WIy94tdl9qN6Hr9yAGwDfQVCsw
	hLPaKi7xQbsuCb37lDgvG3G2MG0vDPpr8oJ7S+ZVdfC0db70s3hVBjrg/SETxoHrR2SZqoHB7ly+m
	2CfU1rxRKnW5GbVfRS0rUnNeSIK52ggEE3ovvcGn2VKW3Hv4bL+00PhIHOa9udXHCC13LfYFoWwAv
	i3mugYJp+//A+fUBw5HZeDebbMb4v4QUMms7WUeqJliKLl73gHdVwz17nXvOvGtlErPghf9uAAndE
	BW0c7bZpQ8XNMg5Yu+1vJtr8EuWJazjvZuKAroZ7LH9CssskNmGiiO6TfF3R5qafiAenYKP7HFSrK
	5hoXd/YQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBYku-00000003mMO-2uKT;
	Tue, 29 Sep 2026 14:24:28 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBYkr-00000003mM1-2Npi
	for ath11k@lists.infradead.org;
	Tue, 29 Sep 2026 14:24:26 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68TCqg39204946
	for <ath11k@lists.infradead.org>; Tue, 29 Sep 2026 14:24:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NQntaQMdAv6bwmg1427kVvEeX1pxaOhWQXRF0oq0sCA=; b=iUMJKNAnEyr9EIEY
	7sxN4UC9Q2iDr8I+qVYCt4amid2hNma3P+5q56O+XjggR0tThDG7j/mZr6sRDmpd
	rDYy4eaNIL+AvkR6BDhDsUHoduAdqkppGUKxBjjV7fSTiQ2Dg4zemI0e5trFJa9D
	y9Av8qudgf8+tIvgQfcGpNo68vUm5uxAxto6HyBEHxnrpPPFzMc64NMOhFIjFKtD
	rryCA00zZC0YbGITWK0qsfS/AwCOZLZ+G2Ejt1CgrGx1UaeAI+yll4+Qe4U6Eq+T
	0LPuPjoQ+4vcRWAGuN06Za/+YKeG2nV9xlN4xU3BZVkdB52sEBeZWAgiYdnkKLXQ
	162lKg==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0144uews-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Tue, 29 Sep 2026 14:24:24 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-14383177746so9430521c88.1
        for <ath11k@lists.infradead.org>; Tue, 29 Sep 2026 07:24:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790691863; x=1791296663; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NQntaQMdAv6bwmg1427kVvEeX1pxaOhWQXRF0oq0sCA=;
        b=jGw/DWBfsv3JoZ9O7KXqp2ClbGyfg6OUx3W17w+TnxTihsU9YNSXt+NZTKzVfwE6W8
         cejVTrw3k39DteU4SisWCp3dkCQWHjkMAdzOH8b1I3LJPTaia6eDncw2BT8YL5iURse4
         VCdPHenRGDmMjI5+gRtG77khJAL4wnqKi4g9SUR5iZUxs3YclkZoe7g4wi8clmWFzHpn
         Qb6HvGyg4OvweEEUriaDqFTsBaWb+l4FsLaSOlV0HHHVjG6ONkRAgef2vvUnkllHG4Yo
         MqmuG6gV1Jnc1A/jFavz3lBAI3ZSAUZGT/7eXD5GLbEn6w/PwQGNaJ0bbi+EdI2fuBrZ
         UZlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790691863; x=1791296663;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NQntaQMdAv6bwmg1427kVvEeX1pxaOhWQXRF0oq0sCA=;
        b=WYmdbzm7C/eQL3Md1frY6Dt8kkyMd/2O0GLkH+SXXjV/zbVtA593hzpfUa85fouDHn
         jeWnHuL1u8xy44/xaw5teZd4Sc/Jwb+DdwtUcW4CG3RGNPahgycU3th/67ipi3yBiQo4
         9qSM6cvFh3OdsG6BbQnCAVd1GK9nTIJRl+r0k13Ozt7BP3o7YRuCwffIIu2RRqAVJffl
         2YrUhGUsgWNeJ59F05esQW2A6pw98zLRy0NdXVoKuwBCpQGYvWzS9HI1kvRUaov2WPjf
         bPUCK6k9aT46w2TCObYzg+6HfKzcyTDQJlteT3cAM+By7HzFtcEr6tc5hWpfJr4KSDXS
         te4w==
X-Forwarded-Encrypted: i=1; AKwUvBzwLsj9Agh6EqGNb/xcgcJ/4Ykg1xocNryxhj9Iy2IWU+GlDinGu7Xe3C0C89lkfNAavt+2q4s=@lists.infradead.org
X-Gm-Message-State: AFuF++leECde/JnX+XMu3gZj/yfQEf98QoePiCZkjRpOgYXKXVBfSvga
	sOEFCOfehiV1rvDzPV1XC4JTFxNl5KHhJtKrKclYFCODxqh2/gc+SmSuv29SylToUJjjLfekiZ2
	4uE5ZOfufC9fF4Qs13bOpXFluqhiEeWhZo5bk12oM8AYXfz/U1jpCCfLnCeTMVrGdRjiQdkFq
X-Gm-Gg: AYBFou1OwOp5mj7wD/JtmOlbqnM/S26kDfgFAgczpYyZ0vAZwyl5d5OGT6Zg0sKV5Ao
	RuSFeo7Jhm6/mLXKQyxeFPijn5ln7jex1W0YBzqyzBR39fH4/ln4Mk5wcAx6M/dwST4Xs9b0ASS
	vF3j0rOwqMbKnNJ+1T5mVmpLHTi1ZplzuurpZ8/YfFNFM5ywT+l29VM960ncVzmkQtimGt5hY/8
	Kf4iiTG6ZPP3T14R0h6n754bF5LZuVXjKeeYsoe0FhWrASOCIGgbqplInNxmTYgw2Q2CIVfSuYE
	v8ubEOC45UqpSzfISAhYw1Bpd7/WHjsh2S5uaCSfbiZSLGDQ8/1C/stLTi98rnesR3EMvbQRU3E
	KJ9q62vKdsCh3kYs1AO7OhbwFt9JloyEmudAUvTU5jsBgEYp/VdbWMA==
X-Received: by 2002:a05:7022:380d:b0:144:eaa7:2758 with SMTP id a92af1059eb24-146ce39b1camr14807612c88.19.1790691863399;
        Tue, 29 Sep 2026 07:24:23 -0700 (PDT)
X-Received: by 2002:a05:7022:380d:b0:144:eaa7:2758 with SMTP id a92af1059eb24-146ce39b1camr14807538c88.19.1790691862289;
        Tue, 29 Sep 2026 07:24:22 -0700 (PDT)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14c60c55ed9sm63209c88.2.2026.09.29.07.24.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 07:24:21 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>,
        Julius Bairaktaris <julius@bairaktaris.de>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org
In-Reply-To: <20260928-ath11k-unbalanced-irq-enable-disable-v1-1-75166f534763@oss.qualcomm.com>
References: <20260928-ath11k-unbalanced-irq-enable-disable-v1-1-75166f534763@oss.qualcomm.com>
Subject: Re: [PATCH ath-current] wifi: ath11k: fix unbalanced IRQ
 enable/disable during suspend/resume
Message-Id: <179069186099.4017622.11718063394355949427.b4-ty@oss.qualcomm.com>
Date: Tue, 29 Sep 2026 07:24:20 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDA1NyBTYWx0ZWRfXyKzKFMR2uy6b
 ShYn31Nz201oCwE3z9WU4F5zng3XD+DySXv88gaPQsBKyDO2zT/TU8hAPxzZQJAUMgsXd0sALt6
 y1yX0ST8XxwBaikw86zGTmrQpmiYR7tFOv2x++aWGxKx1cVF66Cpb8KC6bGpQVzNUQmCo44ZwFE
 GhJ+iYM9qwPQOKLnj/C33Vt/1snaoKH8DyXoOYU5/4KkackvFTf8w0ifqxAGr8+7FdX7/XiabIm
 Uh6bE27irJTBrv01drx/dhoZIFOCPdq+YbeniznQiOmsNEA4b5b0makqt7uVubhrwafBjZzAkM/
 KrwTRJJcLNyBReN2u9qpC/wLxvcO807gG6pFDRgMBQzX/n6usU1JNsfqM5ICre1INj2cbRfMmv4
 AN5xrjAQgQN5sjgO3iSOdpPDB3M5DVSiYD8Wr9sx89BJI1XW4whrHMb93lPKWNASiOupSCaBQW4
 oD1Qs9g5ZaBPKhEcuhQ==
X-Authority-Analysis: v=2.4 cv=FJSOVOos c=1 sm=1 tr=0 ts=6abbca18 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=Tf6FFpAjyP9XlBvCETIA:9 a=QEXdDO2ut3YA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-ORIG-GUID: n73H1rCZD6e4gP1tz4TYnFkVya_lnRSM
X-Proofpoint-GUID: n73H1rCZD6e4gP1tz4TYnFkVya_lnRSM
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDA1NyBTYWx0ZWRfXxsAcB+zXOIxg
 8QZINN5XCTX7Yh/pJ5xu0K5kA+UiQrm6R47mKEb4I1UU49sI4I1tlRJgLzd91/vTKaoSmRlgSX1
 HV5gpi+3gC0HiXTeNNJkwf5E38awi4k=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609290057
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_072425_729463_FC11AE88 
X-CRM114-Status: UNSURE (   8.93  )
X-CRM114-Notice: Please train this message.
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


On Mon, 28 Sep 2026 18:45:25 +0800, Baochen Qiang wrote:
> Commit f7a74e131d3f ("wifi: ath11k: disable interrupts during firmware
> crash recovery") added an unconditional ath11k_hif_irq_disable()/
> ath11k_hif_ce_irq_disable() pair inside
> ath11k_core_reconfigure_on_crash(), guarded by "if (!ab->is_reset)", to
> stop the DP NAPI from touching rings that have just been torn down. That
> fixes AHB device recovery, but breaks PCI device suspend/resume. During
> suspend, IRQs are disabled once in ath11k_core_suspend_late(). Then during
> resume, ath11k_core_reconfigure_on_crash() sees ab->is_reset clear and
> disables them a second time. Those IRQs are enabled only once during
> the following reinitialization, leaving the IRQ lines masked. As a result,
> HTC control responses never arrive, and resume fails:
> 
> [...]

Applied, thanks!

[1/1] wifi: ath11k: fix unbalanced IRQ enable/disable during suspend/resume
      commit: d52302171b61dbba6c9c15e80e9a5f02f1e9f95c

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


