Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A722C5516D
	for <ath11k@archiver.kernel.org>; Fri, 31 Jul 2026 14:41:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rgL7He1dkS7KydTH0CYvAIoix7JpwraSDJaSNfv3xbw=; b=phTMhSW1hZDqyutn9k4Vfx3IK9
	liDuI7FP5c7M8rGO7U0uGZ15wAYVIY8nS9WwBXvohlWWLZEkBRJPy3vVT8lYJU5GUY+FHq1cG8ZYs
	NOI1ytcAogrA+aKX1bqw3MeDbNVi8cMNyJGCew2HgnHnylDeese65qtnJ3UdCANsMmZ0cSBIOSRh6
	syPnxwxzNgA4RlAcAVYlc8MGtJR1BnXpujS82KaTwYveBnsVOH6NzJtyIsms5dFy9CgFoX3aciaH4
	k3dN2tQGQKfbRLe3Sl02yDg0okGf9UgYlvp6hbxpv+TkdjvpCly99fBQEQmFBAq4onVZkTNgpfXJX
	KejiHuow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpoQp-0000000ClKA-0Zmc;
	Fri, 31 Jul 2026 14:41:51 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpoQm-0000000ClIo-1FrY
	for ath11k@lists.infradead.org;
	Fri, 31 Jul 2026 14:41:49 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66VBebKZ188893
	for <ath11k@lists.infradead.org>; Fri, 31 Jul 2026 14:41:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rgL7He1dkS7KydTH0CYvAIoix7JpwraSDJaSNfv3xbw=; b=VhfSyLuaThrby073
	C+GuUBMLQc563ZMF5pI7MK5yfmHjOu14z0/Z2Rdz+I/6YaW0ekjONOfWirwuILTT
	DurKVZjXS5JuUmabr1/P3pSZdfehAnIDEJnI6d9lQcsSRteZwwoiuV5CO6tULd3b
	dFa3gK5BBSBWYVws6c917TD0c2U5XhE6+Ar+QMpaVgsoIpZW+5egKeTs3sCyC8Uc
	lOHd6nAjgeEJNN7G899A1wubOE6/wrom8iPx+FgufZ/na3aQgBCM87eLryM0D5ft
	s54jwCZhyi+i7pP27BGNQ1TeYWsfuF87yRnXnxgPufpD/rhUujCYCLpzu2N2yPgn
	o1wKDw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fru1u0rmg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Fri, 31 Jul 2026 14:41:47 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38f283baf1fso1070198a91.3
        for <ath11k@lists.infradead.org>; Fri, 31 Jul 2026 07:41:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785508907; x=1786113707; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rgL7He1dkS7KydTH0CYvAIoix7JpwraSDJaSNfv3xbw=;
        b=anecBBzbM6bgA49s4C+JGgOsu+RkjiNpq9gnwbbbl7xcG4UmJrF226NofK3BUnc7pH
         TyXLI/DTTMG3v8pYvw8CP+R270u94G+M8iA2gZLoKudLLcicJe3kPgbnWooi/IqMFbcv
         /Tmn4VsRsuvy3PjQJYXOtt83SzxxXBVAfv1OZrCWBUvjBxy0Ne1jLaxCbANyDcEdMwlj
         hmVn7KbxbRGBFgAdqYbB/T4eL5p6FT34zhLsGlo3l/cWmTVkYFz5XQ6Sk4dNweRTLUwY
         GCVhvT7JNDv8qWYCPGZDJRdgvXlLgazdwPLpo+9fG4fwyiLzGC5meAZ+Jr0jaZnTGMCW
         E8Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785508907; x=1786113707;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rgL7He1dkS7KydTH0CYvAIoix7JpwraSDJaSNfv3xbw=;
        b=p/A/jV1kUJZtZ6fpbOGpcXVZtnZnCHId8OzRWNmy1r6VJzn6lGx6NxRKXQZa+YNrYU
         4uS678gu6wdsW+QnUyirwMYms/bXw1usrFlpzmL81FLI8BSGoZ5hgnBwKm+SD3iDYNm6
         nMpVzryKcgsJena7k9v9dJ2+/JdlXuaC9gG9UUD179dNpwmBtD4+vI0bzU50j8pjdVnO
         gw288fKvU2i0c9P3gW/hPHcN0vMWrKAX+dCPj/SAcPfNas5RHJvUSPnN0nDv59tMUPcu
         f2UE4DtfD2paIIFt1AR27FMLIH9pTiO1JBXf/6mcpeqy/EYgkWyzw7b381ODVYaJ4/n8
         +22A==
X-Gm-Message-State: AOJu0YxRetzxBR+4hi/7SSnZF5CXA/71Z9MU2L8LZaSk3Sm4En5s8+C5
	nr7sQc7ys04JUWU5uFMaY3u00G6IGIiBru1kZgRQWpjtugJY3XDA2ULZzPdS286NzIzUe9MR050
	Of3YQ2t1I/hCooa2mTkgVrwwgC8Ee1r7tO3cFKHFYlJV4zxEgU1vI9i+hWncXCVvn
X-Gm-Gg: AR+sD13PODX32f04Vo7zitdVoVAdQRbTfx3G625A8o/384NgGWMbpu0qasWPopo8ZXf
	4wu8iHsrGMaa3/NMMmWrzAYctsb84wXb47bKVCff5AH++QeTAGJqhfLszV9pBSu3OoWj54U69Qz
	1V9rDiP2o5+bPhmhoQvFwhzCAki1pA8hUdQo+xlLpb6Ss++dQc+deYoMoQyCIK/1WarjvtcUUX5
	hO4MrtZ37Bgw+zKEWBfXKcj++CJ0sbLPA5CfmbhtGIjQutPMyLwjr2poQO3MjnB4wNM3YF6Z/7X
	fjMU+mWYE/hGZWaQWefdAaWjuLf5VjXRnnxLsdtdcuB1fwkzkJG2vCpmfzywlZwZfeRdaJv1NIn
	fzHgXE5sDi41uUNxt0HjWFnGyuWn/71tuITl5oDf0cZiX57zHCS0yuqo=
X-Received: by 2002:a17:90b:2cc7:b0:38e:679f:3b3b with SMTP id 98e67ed59e1d1-38fbc4ddaf8mr179901a91.29.1785508906970;
        Fri, 31 Jul 2026 07:41:46 -0700 (PDT)
X-Received: by 2002:a17:90b:2cc7:b0:38e:679f:3b3b with SMTP id 98e67ed59e1d1-38fbc4ddaf8mr179859a91.29.1785508906431;
        Fri, 31 Jul 2026 07:41:46 -0700 (PDT)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153e04491dsm9622360eec.16.2026.07.31.07.41.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 07:41:45 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
        linux-kernel@vger.kernel.org
In-Reply-To: <20260727-ath11k_service_ready_ext_event-memleak-v1-1-e8373d27bdd1@oss.qualcomm.com>
References: <20260727-ath11k_service_ready_ext_event-memleak-v1-1-e8373d27bdd1@oss.qualcomm.com>
Subject: Re: [PATCH ath-next] wifi: ath11k: fix leak in
 ath11k_service_ready_ext_event()
Message-Id: <178550890564.2242004.10304721068858568392.b4-ty@oss.qualcomm.com>
Date: Fri, 31 Jul 2026 07:41:45 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Authority-Analysis: v=2.4 cv=H5vrBeYi c=1 sm=1 tr=0 ts=6a6cb42b cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=o81EXbttbUaOcGQKceUA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMxMDExMiBTYWx0ZWRfX4wedPqKU6gf2
 ZCLvam/OGdIHEj9bVPFs9BAlJvG/QgyrvG/PPIkxGJWNzVXO/FHjc0r7SxqoH5XWLz0IVldI60O
 SAWoa8iOfYLo8bk8VGMfnCAq9lgC0wAN7FZSYuNVyOIb/4hsqPpMPrS7AlTW8r+Ex8Mk7db5AcP
 Trwvkdu2ECskTchAxbkLfi8PmG70j1arDfeZ61W9tb89LjPlG32x5BnYpUPstt4WyIvWzjUYszV
 X7rO7xoOyPfR0xASaroRkDDYTj7VDgcAay5oDxdJjo6t5oEm0tE7aiEiM3Gy8NxDVEnbNBz92vA
 OIJtod0SDvVU6jfXxvHeDfKEkIJQVDe8RQNIKDuNaUtWpXNHUfxmcrXhie0KPywWVZkqbwzlhJ8
 RBs5huPg4axc23mI/dhk6DNAq23UvstjA29fwdocXdoTJ8J8lp0CTAK+RZ+5qfWbdMI/a+b4NZx
 uEr2F+tw15H2w/6Ofiw==
X-Proofpoint-GUID: wRMADBo2wQQx_HkA5eGvuzd-eom4L-Pz
X-Proofpoint-ORIG-GUID: wRMADBo2wQQx_HkA5eGvuzd-eom4L-Pz
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMxMDExMiBTYWx0ZWRfX+S7LW1NEXTKI
 TCiBCUPuAeNmB5pLTSv0ELtJRfWqJxyD2SuY+dtP8SjVGHpszPGLw75w3TwdVGs72LydY8hG9WL
 w8GDjXHt8fO1ZT1PQEM8GBj2P3qwUc0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_04,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 impostorscore=0 malwarescore=0 phishscore=0
 adultscore=0 bulkscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607310112
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260731_074148_349979_DC4BFAC0 
X-CRM114-Status: GOOD (  10.73  )
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


On Mon, 27 Jul 2026 16:39:41 -0700, Jeff Johnson wrote:
> Currently, during ath11k_service_ready_ext_event() processing,
> svc_rdy_ext.mac_phy_caps can be allocated during TLV parsing. This is a
> temporary allocation that is freed on the success path, but not on the
> error path. If parsing succeeds far enough to allocate mac_phy_caps and
> then fails on a later TLV, the allocation leaks. So free the allocation
> on the error path.
> 
> [...]

Applied, thanks!

[1/1] wifi: ath11k: fix leak in ath11k_service_ready_ext_event()
      commit: 0293be2212d319d59589082461abf2a9b626cd1c

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


