Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79E46C54F54
	for <ath11k@archiver.kernel.org>; Fri, 31 Jul 2026 14:41:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zPwG7E1/1GCwuTyANB4YMYv4v4bb/VChjUJ/jYPzKYE=; b=14lLxMQmXiIfHjUDIl3cQs66vO
	pCRt0vQuDJ4YDivjjWXjskRiwqB8ofX8pQH483sW0MdT8Lc/2Kpqcw20CsoWwv3rxZ3ccWQQ4vbOJ
	BazwL6NKFm4Xv/VL4ZxFr7LAYfjgjIGClvKW29nkueyVSVuQahvoD6Ywut/toiSv9PWYbKhYBOmL8
	nNI0olv2y3Yxi+0kL5h0QU72Kt9l/34TIndUFBahn4E4AxqPV7W79sKPu63HwmxgoHLljsjEjqMg/
	aJcjsCchEAu/PReZI/YrcpKz6Archx3/9Cz3UwBXMIwWscn5ft+AZ21XNU9HqSmgZH9PF86Z4fvHu
	U1ztAnLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpoQp-0000000ClK5-0EEb;
	Fri, 31 Jul 2026 14:41:51 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpoQm-0000000ClIW-0cDC
	for ath11k@lists.infradead.org;
	Fri, 31 Jul 2026 14:41:49 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66VBmA1K3905282
	for <ath11k@lists.infradead.org>; Fri, 31 Jul 2026 14:41:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zPwG7E1/1GCwuTyANB4YMYv4v4bb/VChjUJ/jYPzKYE=; b=l7Fwoig/F5CGEy1R
	8z/Xd090sGtxDU5FdZTT9lvIgHHieRNQdB7h1MVcjnDeE3d7kK9CXN2lOI1Xu9DO
	jfZQ8cngWyneLb3L9h3FDd9dtPnrRtlarNtG58a9HORTU2ZBwbhpwBjIHGz9b6+c
	c3rD+UDUfYhKEZYBTVY7hyo7fBRjuwF55yaMNeFYcRJT+dUX85SQIvaI5HMgo11a
	W7YI5g7StA66bmImwiYUmN64WjqG5aSn3sdLTew90BZBA5TMo1i7NNmHf79IVXDK
	Z1MBpuQo0iSGC+xR6Uf1oXTSgGMQkKgjH1ti5VngjCO5d9k1VjxnUaVOyI5g2+5U
	3Y/Qjw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fru5dgryc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Fri, 31 Jul 2026 14:41:47 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38f5ac7354dso1978209a91.1
        for <ath11k@lists.infradead.org>; Fri, 31 Jul 2026 07:41:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785508906; x=1786113706; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zPwG7E1/1GCwuTyANB4YMYv4v4bb/VChjUJ/jYPzKYE=;
        b=IX62eeLoIjZQ5jwGmvTLtPbCUlL1AGqVI/ztusefU0wFTnezs2KQirH58JrXPyKLwz
         klsEMg2hUxlcWrQ8mpA54TzcPC4kRLaaKQQGzJC6Q2Y2DbVsQHyqvaeyHXr09oQo70Uf
         aANEsWSusvYv091Ks0bZIk1xscPWadmWDFEzUTGoNaDnAI2EObm/f49QsgOpOud16BG9
         +m/57Cq9qgBOAiNMsDDWVhV12sWDdCuCk9frZhw3aWx9zK4AolTwJNtDlO05yKZUgPO3
         waTTgCvPMrVTHXkQm0wCsshm5HxCNZcVbKWZN01uo2X/KqgrsNWn7WMDfunKk1RVr9zB
         EaWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785508906; x=1786113706;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zPwG7E1/1GCwuTyANB4YMYv4v4bb/VChjUJ/jYPzKYE=;
        b=hhQ4hmxXOU2Zts61cb2Fe5F/KGMZS38YGD4WP9Ma+21Eb5S44lgW76nQ+b2axvqPGv
         1Yr7JzCCZJDUL32BXScwAsIS+cAMhrjbHf9ovQweKSw662yYb0kpNYfzkHpH2TK4Aso2
         Pil060z9V2YBLCY8Q6CRRYbbYSRoOeSb+qWdYBWTDFRtmW3tM8uAKbH3FEq1YWxevAL3
         PQBp43zLJ4Llpz/qXqMDXTaZavZ2xeIDsPsT5HrZ0EBkIpM9W1gTNvdFiqmuBJK1cubT
         Bn3MFPL/Z6qdqZjj87EMLCmVzll2K150aMfd0IWIJOXVpnP75SOkbvG313KfCkAouBoA
         TAlg==
X-Forwarded-Encrypted: i=1; AHgh+RqKdNUT6lcjdLnYNHbYaBpzs49AFYD3b38rAG2/Ph46dRs1LFVFNm76V6S5fLg/2kdEtXTE5io=@lists.infradead.org
X-Gm-Message-State: AOJu0YxZgyFtE/OntiFkZaToQb2UdPlM3tOF2dhdUzGbN+N2FM4pkccr
	NT6b3W4/19gP3HidWGQggXit7PioZc+XcV1fFojgK6FuzRa0xyT4hc1pdTfcu8Qk2IjrssSzCBp
	upGh4PWkuB0ykb1hJTUxDPEiDL/rZCNAodcIdEJ84428APDLF6Vhm9b+f/QaG9ltY
X-Gm-Gg: AR+sD13r4sppe3w5nD+WHMjkuoO398UL/XacmlSG7hkPNEznVU7PYKh8eftw6AYfZ7e
	/7n8rUrjwPtj5qfkTYlnh7JssXcCwmVveilFoeLtO+UcoZtY5k5phfzWD3HU9t0Bf3bexuBNvow
	yY8ARDyUQnJuSD6VQo10NnZ/jr26SOCdn1rVwPq7IX3lf2t/g1zgbbwpaI9PAVz9zkfY97DApQM
	LoVmeGmugEbQ+Zm50kD6IbCCVflxIoFG6/ye5Yyw81riCg1qpoSF3470kRoakEoAA7TbV89GR0m
	OlanyIMytPJwm04zUkd4YNwDNVDfkDxNASfGn2lihsOUKDKUYaVrhommIIsOogUvPLjy469bTWa
	6znmQo3D1It/Arn/zXm6l3xIPdTYxj9AI8cUWs2jiIwZABynp/TZ8biU=
X-Received: by 2002:a17:90b:4c44:b0:38e:baf:6087 with SMTP id 98e67ed59e1d1-38fbc55b78dmr119375a91.35.1785508906016;
        Fri, 31 Jul 2026 07:41:46 -0700 (PDT)
X-Received: by 2002:a17:90b:4c44:b0:38e:baf:6087 with SMTP id 98e67ed59e1d1-38fbc55b78dmr119359a91.35.1785508905430;
        Fri, 31 Jul 2026 07:41:45 -0700 (PDT)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153e04491dsm9622360eec.16.2026.07.31.07.41.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 07:41:44 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
        Jeff Johnson <jjohnson@kernel.org>,
        ZhaoJinming <zhaojinming@uniontech.com>
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        linux-kernel@vger.kernel.org
In-Reply-To: <20260729020005.219253-1-zhaojinming@uniontech.com>
References: <20260729020005.219253-1-zhaojinming@uniontech.com>
Subject: Re: [PATCH v8] wifi: ath11k: fix resource leak on error in ext IRQ
 setup
Message-Id: <178550890449.2242004.9963469369675962849.b4-ty@oss.qualcomm.com>
Date: Fri, 31 Jul 2026 07:41:44 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Proofpoint-ORIG-GUID: fuAHbrl_zVHp1EtbYr9edfAdLwRV1-YY
X-Proofpoint-GUID: fuAHbrl_zVHp1EtbYr9edfAdLwRV1-YY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMxMDExMiBTYWx0ZWRfX1x430Q2fYX1V
 BL09m3STSwoPn1fKLeMnATi/3fTmeVFytEuHVcl4Cv1R6JFI1zzxMImcMa7ns5Rb5Gnvfiqxfkc
 XLpC2vZtlcXywjURFzBwGzR4CR+NmDHgkZMV+r8HAzvQNcPAaREdNKdXvKpeXfi9cvM3XWklkIa
 gn/rAoShxnYDLoRR5MEA4YzgXTjW9PW7H6kGItu+WT1jQMzic7cmQncle/fqvxhTunh3yOP6sbd
 X3rmqOe1Tm7OZBYTbQ3irDAV9qX+46rMsP+eCxeXepFuZh44v7zzgST3b8j5+lUf7P36ZnSngVf
 4TmS195LQhgOkmhvdteypx9F624GhjjtuqwPfPeemKPV0yLNC46IGFrDJaNi/s1eCPuaPlJTmwv
 TQvAUWIcPzKULEeIfaiw/CoqVFq7HhiftfLsc25LSWscHZKitGr9OG+FRaJhJlVh5I9Lab08OWT
 SpNbhcghDtpJ38Bl8sg==
X-Authority-Analysis: v=2.4 cv=SKZykuvH c=1 sm=1 tr=0 ts=6a6cb42b cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=WD2RVSGR4ZOmZR8fVjQA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMxMDExMiBTYWx0ZWRfX/iFQntVbJWVC
 7MeCSe58L6Je9SPSnmRXAFdN6BluLIGn4c/tzBlLK/2FUkHTycAhDHeCdZl/Tz5NtRB4EfcOjbI
 EbfkqnfJjGB5O7Ru0ORqYssevWjHpjc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_04,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 adultscore=0 impostorscore=0 spamscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607310112
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260731_074148_317542_466B49D9 
X-CRM114-Status: UNSURE (   8.15  )
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


On Wed, 29 Jul 2026 10:00:05 +0800, ZhaoJinming wrote:
> In ath11k_ahb_config_irq(), when a CE request_irq() fails, the function
> returns the error immediately without freeing the CE IRQs that were
> successfully registered in previous loop iterations. The probe error
> path does not call ath11k_ahb_free_irq() either, so the previously
> registered CE IRQ handlers remain attached to the interrupt lines and
> are never released.
> 
> [...]

Applied, thanks!

[1/1] wifi: ath11k: fix resource leak on error in ext IRQ setup
      commit: 8ab38bbac02298e3fb03008ed4a0227485c0fd62

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


