Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46E13CC6B27
	for <ath11k@archiver.kernel.org>; Wed, 14 Oct 2026 16:24:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ouAxRHwenlnoXS5Tux7sQi9RKyjdy7jbFf5yy8ngrps=; b=Ku1gJQF3qZZh6QVkhczoiMPK/c
	BvKipJVS/Cszsw4qIfTpendZ9fnamevmJXHIfXit2YCQs+knzHowL8jM3udaF+CkL9uYzrF2unJy9
	s07Tr4fROjZE/qPADau+X3f4RPjZ05UD5Rv1QCHBayULUWPvP9LUCb8r1OgGqsAEN+AOQ3J21uYw6
	Qtd0VAf4RtikWQCqPPI4PcAKUpN6CcrCppIHSeZhhafRkPxFsvjGptZAbQqWjyol0/WcjF8/j+pX4
	scFdBM59uw8MS6qSfkbP0NdfkXULwiIyCd4HMDSRfkNpXt0sfpKBxhSloa0wVSFqK00GVTHFLmhBj
	LCY4k9Cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xH1ly-0000000Fy6n-2VrN;
	Wed, 14 Oct 2026 16:24:10 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xH1lw-0000000Fy5l-0UYn
	for ath11k@lists.infradead.org;
	Wed, 14 Oct 2026 16:24:09 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69EEcbQ13209612
	for <ath11k@lists.infradead.org>; Wed, 14 Oct 2026 16:24:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ouAxRHwenlnoXS5Tux7sQi9RKyjdy7jbFf5yy8ngrps=; b=TVt1quCOhk2aJt2L
	WDTmchuxvsXQSrm6aFnTwnuNdAeUccpUmLuieI9w8wGlC5/ettWRGulXh3iRo2uV
	JH7PDqufGPJdmQ4tNxQoqfa+PADZc1XtieAy+d4s7pZe0AFpiLASqJLr5aWwcil4
	mSVl9ZoWBOr1cuhtlXX5WwH2ha7SfWcjAI0utaiq1irYwRn2muxuT9dBaYMtrziy
	cIZ/nliVPnypcI6pvmV2Oh0i9oi1Vwv6VIVcRaiM5u86fKNZY/NLjUSao+b9AKuf
	SOpafrzLnm07/pxEzoHM3Bvalj2/95ugi9vzZsp+zm9uDrWDYIk8rlUwTVlPkSc3
	JEFFEA==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9ud6cda4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Wed, 14 Oct 2026 16:24:05 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-35c813a2e14so289285eec.3
        for <ath11k@lists.infradead.org>; Wed, 14 Oct 2026 09:24:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791995042; cv=none;
        d=google.com; s=arc-20260327;
        b=P9DvW82i7Y31oqdH0mV8kRQF17+DHTi10OLzemmJW0KJ2XSGPNK5NDzKOukqd0MeOg
         C5uWsHV7bkdr7ptbd39J71py83NuyZzZSDA0qY0G3L0Xjm1XFjOZtU1hkYJbcp5MIYDd
         zGVQ2DTYSF1TfssIu7h32a+cOyR+UL0prrhrxGsjBH7O5MDApG4hUeT62O3c1995vra4
         Ia5mQ9TaoMN5Ir1vhFSBPjw8PQfH+lapJXKh6nnW59Vh3hFnBl+X3uW93VEzIxd6DiGP
         W9SoXk3Kvw8IfCDsMvQgAlFuMZ7ipyLDlykncvA2sS14CNNMDKBwCc3FI7UvIt8WAnn8
         3XYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ouAxRHwenlnoXS5Tux7sQi9RKyjdy7jbFf5yy8ngrps=;
        fh=n7g344K31SnOwUh/3ey2K/D6240gMyj4OU7GiLh3Nzo=;
        b=HB2y72Cm3SPnwUUmXIn472poUz35keH4IOz8A8svgH5d9j9k9XXV5ibqWmnpIMcLg3
         CcOOOU4bkZ6BXX9VRPtoxPsCNX1o7pR5jyVlnOwri4VZwwwqJ214dbglPv8k/6JxCq14
         xCjvdzzX7fvy6bEymSHrjUfcMwI5P+riY1BCf6wZTkjchT7usT4vLM8BJ+yFa9+7aMLr
         0IMo1JTpwu/BKwCVfaV6ZTrWRwOkjt9Q19qMBpei7juUOE63PGRhXRnm5V8SllR8nLKO
         dH0qnAV8ql6jkWaEm8JZWUuTzrTE7zna7AJiJKehj/VHlmtekQ6Ee1r+xguD05Pjm4OO
         Uyzg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791995042; x=1792599842; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ouAxRHwenlnoXS5Tux7sQi9RKyjdy7jbFf5yy8ngrps=;
        b=a5SULRBx2ZZJfw3qVdX4TkVMhi1AujOklzwjxAfAL7awBASqssaSEGGtSX0WQ1mn9Y
         1IrqsjZ2t6jYej0nz9HPNxi+UkWEgljG5lUOt9g9fDAhJLPEsdNxmWYvwZ+ucM9qiOoT
         bpp6YwmfAWXyx3NjOyYF7dyoT0ROECGyTbxAkDV2jGdl+HmRoVvmFtvEjLzDN49BYzzN
         QzWxXHOz5a1XH5/s7hzawNdfP3QyaG1rFGVeQBVsdO5O9goRWm6LUt6RjRIGagfwwgzm
         gDH+Zoe4I8o6I4V2urLjzOKj0n2/CrrCZuDlGkKy5dB2Q4Zf6iWQhEghhFKLw0bNUF+f
         rB/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791995042; x=1792599842;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ouAxRHwenlnoXS5Tux7sQi9RKyjdy7jbFf5yy8ngrps=;
        b=dYSO1pZqHpnvjN0hezalJDHbUxFk6RxKOKmpmIwEjdqP7GQTcGfT5fChED97QI5JJc
         RR5oHo5/JiUouZLer36ZQrbkomZ2OoK2TkXDJsMw/AXuXI4dHv03TgC0lY+IU1f3d443
         8BNvubMoJ5c7w6pC2dpdh/vC3HrHMMqAUb7YQ4bBWMf8H4yVRtuOHaJXx84EkJdYoglQ
         AEQsm0ff1ZUhlx5FP2q7YdIvdHiphMStAfoY4OU7JajQvEIc86A623wk1OJcp8fo+GFN
         n6fzP28klLaSbXvaQqKoQJ2Cs2FyourFjxl3iNSjT/tJU6Q9m2j27q1IiLHkgkfVZM/L
         ChrQ==
X-Forwarded-Encrypted: i=1; AKwUvBwCw+zHZOSiIQsG3VcQD64ekg/GGvPUDpMCQNxEevfLFbRDShtIYH85/ANX0nmOvJvkOFeO7FY=@lists.infradead.org
X-Gm-Message-State: AFq9FYLz0pBN2A5NpD6wljYWsIDgpveCcOFakCF3rySdrGL694CPasDW
	6DIvpjBUBu9CvABaM3ATm7/DfdrMP7cfbDvKARVJBdp+ezc2MnoMicAygZO53JN2ZTdyHz3mNOx
	8yehF6y04yLcxipFFSGHb5BAncyoTanHbeZ3WiccdnfRC/xTsqyI/Ppmt//P5douYkPBScTFlih
	z+lLTOxRmzWZD/KotUutWwmzgoqoSacywedywLss8=
X-Gm-Gg: AYBFou1oWEsMGJ4U/I3OTIsnLJn1aBeH+lW5yYfjItN6RANmFRhGMYfYNiWg+WyOEtC
	uI6GpbUsIAznmoFXHP7bXnIX8XJlsilgOoBXkuyhgWbC7v6V2WjI8xEoAxQurBkXeMSuj/fo/2I
	S7THKfwhIrv1jSXudE5OylmEF7dHLvwwLYINjGp/bdbNivlDwi37AHF6XXkx/Up2tdPxFDkflnd
	2t7iI77OYaRUDrn1g==
X-Received: by 2002:a05:7300:c01b:20b0:351:e21d:357d with SMTP id 5a478bee46e88-3537dfdd089mr41541483eec.1.1791995041924;
        Wed, 14 Oct 2026 09:24:01 -0700 (PDT)
X-Received: by 2002:a05:7300:c01b:20b0:351:e21d:357d with SMTP id
 5a478bee46e88-3537dfdd089mr41541456eec.1.1791995041308; Wed, 14 Oct 2026
 09:24:01 -0700 (PDT)
MIME-Version: 1.0
References: <20260917064825.12747-1-jtornosm@redhat.com>
In-Reply-To: <20260917064825.12747-1-jtornosm@redhat.com>
From: Tamizh Raja <tamizh.raja@oss.qualcomm.com>
Date: Wed, 14 Oct 2026 21:53:49 +0530
X-Gm-Features: AclHuK-uImdXK88rnU2XiKtyAUjSR6pC3yRcEp_C4bR0864jreBK1-o8m4IfHpo
Message-ID: <CABkEBKbHhxNsx5ZpYCSDEKtC2UpR+PD4hSF1CeUOwUBkTq2XKw@mail.gmail.com>
Subject: Re: [PATCH v7 0/4] ath11k/ath12k: implement TX flow control
To: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
Cc: jjohnson@kernel.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org, linux-wireless@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: 6IXJaI8pferOMCfgvpuZmEOxWpWF58jE
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDA2NSBTYWx0ZWRfX1FdVRTTGXT2d
 /66oWZj31/JM8/WNgBivA6ez7i9WsI6ipM2kQ9poXuTeM5c8YxNlyKVC1SN9qh9QxM4YvNzUusi
 h9vhZymaBW91dGr0QCHyr1neBlJkwUI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDA2NSBTYWx0ZWRfX7KukPcaqWopc
 F1iwwcrK4habp176bPrVWM0vdOBw4Mxq8apci+Br4zt9nYOknHai8rUYY+cbmts9e1RO7t8tvr1
 zbTc4zUmj41Nic+13IFmUjs2u9CopMJCDb8iS3OwuGp52NPN8jp5FK9t548mjIWkcb6SikIvSy/
 Xsfyc+W8wbkvHP+rmuKrgVnj2lHPj8wRU0QFlyAlK5RDXN27sD3SkZf82ZC4c7FHrDFYb5jMDGZ
 QJaL8nlqGWtM6Ke1ZZUnJr9KxNKHD3fY6E2VNjjJH68CGDT8hJRTWqrx6+gXU0bMy8Ynd5PBM1I
 0+ltvqj7/Ff8wMsMXbQAGvonSEBfTYFeFEDpXI1s7mkzXiI0N8dG52k11yuk72IPG45ECWC6bwo
 hVraRn3HS/PDvVuaOdGfaZXhejblc5B5e0qENzGMltY3kCCmB5aZ5RVZnxUh1VLt5WKTbCMSJ8i
 CqPbz/F1UcMygzV6KWQ==
X-Authority-Analysis: v=2.4 cv=fJ6sTpae c=1 sm=1 tr=0 ts=6acfaca5 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8 a=20KFwNOVAAAA:8
 a=lWMnthoht6l5_8CjfcsA:9 a=QEXdDO2ut3YA:10 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-GUID: 6IXJaI8pferOMCfgvpuZmEOxWpWF58jE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 malwarescore=0
 suspectscore=0 adultscore=0 impostorscore=0 phishscore=0 bulkscore=0
 clxscore=1011 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610140065
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_092408_202615_C50DA2BF 
X-CRM114-Status: GOOD (  16.04  )
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

On Thu, Sep 17, 2026 at 12:18=E2=80=AFPM Jose Ignacio Tornos Martinez
<jtornosm@redhat.com> wrote:
>
> This series implements custom wake_tx_queue operations for ath11k and
> ath12k drivers to prevent hardware ring overflow issues under heavy
> traffic.
>
> Without proper flow control, both drivers experience -ENOMEM errors
> ("failed to transmit frame -12") when the hardware TCL ring fills up.
> Additionally, ath12k can hang under sustained high throughput. These
> issues are more commonly observed in VMs with PCIe passthrough but
> also occur on bare metal systems.
>
> The implementation follows the pattern used in the iwlwifi driver,
> adapted for ath11k/ath12k hardware ring architecture, checking
> hardware ring space before dequeuing packets from mac80211.
>
> Testing shows stable operation with eliminated -ENOMEM errors, no hangs,
> and improved throughput under heavy traffic conditions.
>
> Jose Ignacio Tornos Martinez (4):
>   wifi: ath11k: use queue mapping for WCN6750 ring selection
>   wifi: ath11k/ath12k: remove skb parameter from get_ring_selector
>   wifi: ath11k: implement custom wake_tx_queue with flow control
>   wifi: ath12k: implement custom wake_tx_queue with flow control
>
> v7: No modification in patches 1 and 2
>     Address comments from Jeff Johnson:
>       Patch 3: Add the defensive pattern _bh in both spinlocks (ath11k)
>       Patch 4: Add the defensive pattern _bh in both spinlocks (ath12k)
> v6: https://lore.kernel.org/all/20260811172435.616200-1-jtornosm@redhat.c=
om/
> --
> 2.49.0
>

There is another series touching the same area: "[PATCH ath-next v4
0/9] wifi: ath11k: airtime queue limits, fairness and a driver TXQ
scheduler".
It looks like there are some conflicts between the two. Could you
please take a look?
>


--=20
- Tamizh.

