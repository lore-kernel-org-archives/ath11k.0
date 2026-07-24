Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A2F7C531FC
	for <ath11k@archiver.kernel.org>; Fri, 24 Jul 2026 09:05:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fZAO5VBS8eZkNXTswb/DHceIXIheF14CYuGeiDaluF0=; b=lH5kxoqK0gem2xlSg2YQtgdpRP
	qpbZGNcYgfW95i7OqA7QodHbccFDUyr3dgRPX/IMfZE0Ziw8rtr2LX7VD55XNeobHE4aqTDBGUxc7
	ekhQEE5/Z49pywDj62dwgxjteXcy1970cToiMsI4pYLDX8sJtFrD/ucCizxAcdLFBBWZGabMETTe5
	pF/eySNeOuROtT1ZSiyaKb7h96J4q0HYvX+scq+zoM5oAWQDrsRaKJThPTA+s06/2b8SRqmOL2K8k
	LOjUQqYKz9wfpF+RyNdYlztLFmBAp8+RhLzAKVqlLyj+I/b216/VFgFh4sx/sr8x3dFo0b5lIpx7W
	dDMdZYNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnBq0-0000000Fuql-2n2U;
	Fri, 24 Jul 2026 09:05:00 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnBpw-0000000Fukv-2ZWK
	for ath11k@lists.infradead.org;
	Fri, 24 Jul 2026 09:04:58 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66O4soLi1897557
	for <ath11k@lists.infradead.org>; Fri, 24 Jul 2026 09:04:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fZAO5VBS8eZkNXTswb/DHceIXIheF14CYuGeiDaluF0=; b=AHCha4M6TFyeZlQv
	egQDz9kystbL4aLnNC27Y4LRGKI98RWi+yyjy8Rh9PENjQ7FWmh7kPx0R598z+XV
	jY5/Fj20q2w3xmzrdhTPdil6aDgVcPM7h0cENez3f9NEaqrHMZo4OMm5Yv8qHo56
	1I2rnksgzPeUB0vgB6oN3AFWg4fh0UkmiY81NiaWe8Q+CMci0V2QnzOO26woCPbj
	q3rrn0qy410bIMr58EFz7lcp68iH+j62skdDJPgj4YxABAKxy+7Auuzbg0mNJqbq
	0N3FzPV6i5WVtBrrwdSFrPLLyX2ny514iC/wIAF16wzgSuAePQwy0RePpFooB67U
	VKr2uw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fm1em8umk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Fri, 24 Jul 2026 09:04:55 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2ce756aa72eso844545ad.1
        for <ath11k@lists.infradead.org>; Fri, 24 Jul 2026 02:04:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784883895; cv=none;
        d=google.com; s=arc-20260327;
        b=Dw8yrX8izrV6aoSKjME19jrSRkRcV0Gmg7elNiQ1kMmbRXOo1jlI8AsW0Y90cgt3JW
         zZbXeDjbuJ8XVscLMFXFePtTD+wTBx3c8zbYEKa5AHyI2CZYg9s0+23q964/TZ7oDKeY
         RIlA7wg+0w48XuPLOGpaF74GOX3nCsDMI+eKIVTBiEBzesCvsNRxrfguk2/WZHWT05hH
         sx1GNoMlyLgoSQd4Ob1CfWzTtaKgYNn7mVDrWRwg6VZMrWz1f4KimI6OUvq2VqkQNn37
         gVveqE2TXjLSeUSjCco3YCeeKhJ/IeAvfZLywRZBrveqPYDgEcZlfTnawInJ29McbqCD
         U3mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fZAO5VBS8eZkNXTswb/DHceIXIheF14CYuGeiDaluF0=;
        fh=o683acR5suqRi9+uAUvEx2arA4SSkkc8GA427lelJYQ=;
        b=pb5Xx/WLaCG89ufIPzGeaJqJUTaw2+j7qxWSuXiHDYrJngxZ8bC01T1ESzCMppp6h1
         sFqdrXEfYxFvS9HGIEjElbfHogEsOre7ycAlXXpH+dAjfpOGrAvgMxEdW/bxXd9sF8hy
         rst7OJ+f96BsfXcaww03XKJaPlzPxkMNWlzsxjX3nqvfXImtb1VOYK4F0J8eq7v41ZyI
         /AGj0uvRzc/O9dn/LTnZ0uuDt2GsTyJSBxR/jsM3mEsUNIoGNbJSdTRit1jIisTX97Nc
         slwl6taUAnEuaP3r+xVtBMVKnT+3fVFTlcvtoDKb0UZqboCYZT58htttvmI+az4DCIwK
         QA9w==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784883895; x=1785488695; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fZAO5VBS8eZkNXTswb/DHceIXIheF14CYuGeiDaluF0=;
        b=gKM8htglwJiAK4rW8uIxJgXkoRSZRFVTPPDIs8gH41A5nz2U48NIddPoWbjE6AwCft
         Gl8epmWcvM78OiUhxjs0Gf/boWyQFBYPR2gRRN4DQOGZfxLj6nPm6oI/ZEHC4ojCvyVq
         01mUVzHEZMMdRKGqLtDjlTi45jDWINC3YTu+7rhZjv3VNYHHWOYIeHEY/vEux4nM0qSt
         cHTQkRPFH5j/4zdyHeTSRSmTGWiFzg4cD+omnKDGK70uR1kn8Z1l5ZXr4iwUB7eIHIWw
         RqvPHtbF44iSAf5vHOlXgMq3n0MQ4pzyTbvcckAWV3eSkFW+HRAPy68Kkyffs1VTAlFR
         Nf+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784883895; x=1785488695;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fZAO5VBS8eZkNXTswb/DHceIXIheF14CYuGeiDaluF0=;
        b=ao99ilv7r1DyFnI9UfXmutim85rQiGYPMwnqalSk1GqqyyIsaF9iRMvMgpDYIO/gnk
         lS/U0meG+cCq8R9uH7TSJOnNTMXKEgchZDrO0CfxRpd6ISo+sctOpgzktzk/dP/1SaRv
         4nhBHO1FFasN/md8DYp5P0vfzL4EZmQqBcYb/8hnce7IyF2Y3JzZfGxrPMeawUc/5IqY
         NLhtrvTCQ//1LDiv5F4SG4sZeEHIXzyPvOHV01xggH9ePeG+6HH3VlAU727R3VfNYhue
         Eu9miPP5WTp4Ks53wzCYFPr4Q2ZH3T+7H7VIwfMkh5jYAnmAQ9w4V4ufRj72vwa40kU3
         yJRQ==
X-Forwarded-Encrypted: i=1; AHgh+RovrvGLaCMue3FeHd4MA5Y6KRRdbfKoeo4QXaV9MCDu7t0x6TbkqAxjiIjpJ3nMEvkKmdGuQ60=@lists.infradead.org
X-Gm-Message-State: AOJu0YxAbCd+SScaFZ23I1ZRexJCVkUsyHEz+ebrADcZ3s7/Gjt9G3ne
	F3xMzhX8jTjUHggB5YSkONK4LJbNjfdnaAXv0Wn1jwjX86ughQSIPa5ad9YsRyMHPbKnsxFIo60
	6RAnLJ03xBIyGdwyK9bq8jXqOD+iZqbVewTmdL0MbZvSS02nfJs7hnDtPsKznFsvd3jH1nCd++w
	uW8rlFIYTi/2J+lq8pB/q27CJzOhluHQ6rpuFt50w=
X-Gm-Gg: AR+sD13vf24mxmJmD43VYb6AhoYyyMS855SZgPsT/8tI7D00LxXLC9IvIPF7Xqp+u6f
	JfJMthXHgL98HI5yjLQBB7VjUyEFEMunz5/cwgUGDynyfXZLcgDcn0TMGz//jlRGl9JgbmgJnAS
	EA3DdaS6PtOX3O3hrnaHQspD3wpRKHIjSHey/+cviIkVRPbQmk5+P1Ln9FYODxFecuChmEAh+1b
	TZx4LgGeXJRsoP83w==
X-Received: by 2002:a17:902:ebc2:b0:2c9:8287:fd0d with SMTP id d9443c01a7336-2cfbd0a236bmr26057465ad.3.1784883894632;
        Fri, 24 Jul 2026 02:04:54 -0700 (PDT)
X-Received: by 2002:a17:902:ebc2:b0:2c9:8287:fd0d with SMTP id
 d9443c01a7336-2cfbd0a236bmr26057285ad.3.1784883894238; Fri, 24 Jul 2026
 02:04:54 -0700 (PDT)
MIME-Version: 1.0
References: <20260724053121.15759-1-jtornosm@redhat.com> <20260724053121.15759-2-jtornosm@redhat.com>
In-Reply-To: <20260724053121.15759-2-jtornosm@redhat.com>
From: Tamizh Raja <tamizh.raja@oss.qualcomm.com>
Date: Fri, 24 Jul 2026 14:34:41 +0530
X-Gm-Features: AUfX_mwXA07Oamtx03sMzNZNVbXTzN4dYKzsEBRAeKRrqOc10ocw-mkQ-MvjSVg
Message-ID: <CABkEBKaZOEh4OrZTYfFOj8QZHY8Ruxn2rcXL-axWHwK4o6MECA@mail.gmail.com>
Subject: Re: [PATCH v4 1/4] wifi: ath11k: use queue mapping for WCN6750 ring selection
To: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
Cc: jjohnson@kernel.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org, linux-wireless@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDA4MiBTYWx0ZWRfX8YhkmpdGTvKs
 DYML9QjpeNew5Kd1sNNR8dxZ4dA//SEpRtMCij27LXIabMyjisbA1T3IQttRqQ5F5nIxqjRPanA
 /8hrrUtSrbzX3E+/vHViuWReRCsxZAU=
X-Authority-Analysis: v=2.4 cv=BIODalQG c=1 sm=1 tr=0 ts=6a632ab7 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=20KFwNOVAAAA:8 a=bisvXKnJg3u-O0vvLn0A:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: AWq_o4AtjNOQWN2GzWlEs6pyIejc6cwQ
X-Proofpoint-GUID: AWq_o4AtjNOQWN2GzWlEs6pyIejc6cwQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDA4MiBTYWx0ZWRfX/9iw/rW1E5U2
 M42BCl27Wu1uC2a4vFcjNohPIkDRxJMnwksy7SLyGimBQ1pYIl5wHYsm+GmSLP6tbtipR8DqPLZ
 IJPFDdEQw1dQfOOtJkNdDOHEFEN9e/0MWxsN6bSKZgq+iKXlKLAJGxT7OXEEM6GAyngdvy0P6Yv
 whHa0MPZJZ94eKtWIIdDlYcGiDvqDIbVOi9l8BDMmsOEVWUpYL1kdz2VAJ0Vo42/DupuC4Avb3n
 4zWU+IUY3OZWyqVPVyhbpOM7grJyjOT0yrMzQKiZ5ZHS2ZutiPOuw2y33QOpom+KPqov32Z+tgU
 XJwxI/m3/y/vgkdkQ5yA65N0cC2UCuGRAei3mcYVxM9hh7KwQXOMTRSC0tp48hbILtyK/kXBx2t
 4qBi/4NwJCBlZI8GMgIEL4u16iCYmplHjjzZnDUY87jHbNC9Ct23O0tNWEJns1cHCFGzbNUTjI9
 RZGnA/8nCLCEUx4I5HA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_01,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 priorityscore=1501 malwarescore=0 bulkscore=0
 impostorscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607240082
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260724_020456_734560_8148E8D9 
X-CRM114-Status: GOOD (  27.89  )
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

On Fri, Jul 24, 2026 at 11:01=E2=80=AFAM Jose Ignacio Tornos Martinez
<jtornosm@redhat.com> wrote:
>
> WCN6750 selects the TCL ring using skb_get_hash() to distribute
> flows across its 3 TX rings, as introduced in commit 7636c9a6e7d7
> ("wifi: ath11k: Add multi TX ring support for WCN6750"). The goal
> was to prevent out-of-order packet delivery that could occur with
> smp_processor_id()-based selection, where packets of the same flow
> could end up on different rings depending on CPU scheduling.
>
> Switch to skb_get_queue_mapping() instead, which returns the AC
> (access category) assigned by mac80211 in ieee80211_select_queue().
> This provides the same ordering guarantee: packets of the same TID
> always map to the same AC and therefore always land on the same
> ring, preventing reordering.
>
> Using queue mapping for ring selection also provides QoS-aware
> distribution, where each traffic class gets a deterministic ring
> assignment, rather than the random distribution that flow hashing
> produces. With 3 rings and 4 ACs (VO=3D0, VI=3D1, BE=3D2, BK=3D3), the
> mapping becomes: VO and BK share ring 0, VI uses ring 1, and BE
> uses ring 2.

Combining VO and BK is fine? since VO is a high priority. @baochen any
thought on this?
>
> This matches the approach already used by ath12k for WCN7850, which
> has the same ring count and uses skb_get_queue_mapping() for its
> ring selector.
>
> This change also removes the dependency on skb_get_hash(), which
> is relevant for a subsequent patch that removes the skb parameter
> from the get_ring_selector hw_ops callback entirely, enabling
> TX flow control in wake_tx_queue without requiring a complex peek
> to inspect frames before dequeue.
>
> Signed-off-by: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
> ---
> v4: new patch
>
>  drivers/net/wireless/ath/ath11k/hw.c | 8 +-------
>  1 file changed, 1 insertion(+), 7 deletions(-)
>
> diff --git a/drivers/net/wireless/ath/ath11k/hw.c b/drivers/net/wireless/=
ath/ath11k/hw.c
> index 93f9a03c48dc..d679e39dce03 100644
> --- a/drivers/net/wireless/ath/ath11k/hw.c
> +++ b/drivers/net/wireless/ath/ath11k/hw.c
> @@ -891,13 +891,7 @@ static u32 ath11k_hw_ipq8074_get_tcl_ring_selector(s=
truct sk_buff *skb)
>
>  static u32 ath11k_hw_wcn6750_get_tcl_ring_selector(struct sk_buff *skb)
>  {
> -       /* Select the TCL ring based on the flow hash of the SKB instead
> -        * of CPU ID. Since applications pumping the traffic can be sched=
uled
> -        * on multiple CPUs, there is a chance that packets of the same f=
low
> -        * could end on different TCL rings, this could sometimes results=
 in
> -        * an out of order arrival of the packets at the receiver.
> -        */
> -       return skb_get_hash(skb);
> +       return skb_get_queue_mapping(skb);
>  }
>
>  const struct ath11k_hw_ops ipq8074_ops =3D {
> --
> 2.54.0
>
>


--=20
- Tamizh.

