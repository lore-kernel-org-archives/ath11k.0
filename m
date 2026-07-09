Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BE39C44501
	for <ath11k@archiver.kernel.org>; Thu,  9 Jul 2026 14:49:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4C0rBF8eoOikPGKXr1eu52DTy3xRy33I6NKD14j5lOg=; b=TlFSzEixJ2lB3p0IRzC2ndD2YQ
	NUGr79ffgamzis3lqbsJYc2AMFo0LFXsiBAOitLfpS7qdPBlpeNizfj3I8CslALcXB3eGti9ltN2p
	SA3WiUnTf+tjfAgYE8mD4+RnRzb34o9CrS/GmYFuAiku8eeHn1QJwWlnmGYxdVr9e8nra9VUTjuPc
	ttJh9Z+ZwUTtVOgCC/BFsa/ywVH9CRcqrEAsfeh/BS92/xIwMdsdmaQFbmupqynXTLKMUltoOX/XP
	CtYDfsB2NZmpFfoQuPhI9eH2EvrvO2OQ5iybpoiK60kYU7mfuAQPmdU0EKaYBcpSntq3LxL/o8ydH
	6FyKq6SQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whq4a-00000002pbk-3HuZ;
	Thu, 09 Jul 2026 14:49:56 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whq4Y-00000002paN-4Bo9
	for ath11k@lists.infradead.org;
	Thu, 09 Jul 2026 14:49:56 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669Dw2Fe2063297
	for <ath11k@lists.infradead.org>; Thu, 9 Jul 2026 14:49:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4C0rBF8eoOikPGKXr1eu52DTy3xRy33I6NKD14j5lOg=; b=evaVopnIYdtIrxlE
	srq5IuYeqWHxBUDcUV3oioLeZrvgX9crPa0W7ctGEoaShFxlYVt5dd3GOQ0TjE0T
	sDDV04DITc26MtBtwHgv44sZdBT7Aqe0Tn8oh7Xz6UaEZJ8Ksqiv+xWw+zGDl1UO
	PQzMMpAUIfVKhAJz7ijdSSYWie2ut0rnzu29Nk1EGDhb4E8ZRlFORi1G2NL3vZQ/
	U1Ezp/E8JrsBK2bk/vg8xkBYXSFOb6zpgNQNOFzQcXDjpbDUAMbvl1lKOS55tT7N
	IIF7XlaTS5p4CJmyJ/NG2DwnEDH4hecPtrdpUAgn36LaKw0LG1cmnPxCauH0a2Je
	ewJxSQ==
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com [209.85.128.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9v4vvfkg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Thu, 09 Jul 2026 14:49:54 +0000 (GMT)
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-808a9e51918so57626777b3.2
        for <ath11k@lists.infradead.org>; Thu, 09 Jul 2026 07:49:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783608593; x=1784213393; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4C0rBF8eoOikPGKXr1eu52DTy3xRy33I6NKD14j5lOg=;
        b=BtjCxs5m10IM017NK3wLz3ywW7894q1ND764EUKwgfygmjo/YYudof8cNRvXvTqTNX
         KSVw4F8o2wGCUE5K3NNsxpIOZfsg1k7Vx7w4KojCa1y7Pv8cxzMUWC4Fe+8BXY3jg91M
         YlqeBVvTA8f8H65p4IDY0s21MH5UoPZ6dmxFVdKcLU8KVhN5nZMvPJwyKajlnmgcOSnG
         zhVJjyndtNj7S0IFbtH5i2JVVrpcQfbsdUocu3nnvvHO/yiAMHGlNwj5caWTwAZkBMFj
         0PFUGgvHFrywL333CtMo7oQfkyHgTDkxapQ5NYZPzql67Z5fnDk0RkQQak7MkLQ2BhVa
         55wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783608593; x=1784213393;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4C0rBF8eoOikPGKXr1eu52DTy3xRy33I6NKD14j5lOg=;
        b=W3Dl7VZeyavg8AztZ4lF2CAu1d0IdORKuaOyQUtm1I/n+cTBRgMkxd5siRyhX11kj9
         BaEAN/b5fEjIsW6m35dJiRZ+IVwZRYQdVoFc77vvFu4VN9NUchzlkjzRN3FxuT46lv9Q
         L1Gb0YODhAysxs974dKJIV9N5fXU3nOaY+J5Kby0XuVBu8JeeZQeOKzNJ2+0XICI84EE
         3K53nSbAFQtnjUBixAAfEE3Xe6n/bj22L6TVylnvWZRSOjHYtTjLM7/7b9o6RJo4N4PP
         iQwvLFMBT0HB46xPRGIoe0paN6xFPD0ojziztCsZkQ1WmG4Q0u5ujDPpyG96LJkOe4jk
         zAyQ==
X-Forwarded-Encrypted: i=1; AHgh+RrS6PgIyS0hZp4Wrb21hyX1oZMtjYBzboQ54/jCs+Ew9HxEtGbixp6DM+6gQ37HZ5dfFE5Md0Q=@lists.infradead.org
X-Gm-Message-State: AOJu0YxIkZEN46oMzuJbnuvzRDN9PVM9uRbjpMsIZJxEv41elUsw0S3R
	3v09CwDB6/PAzIwCuD4SDRN59aJgnjeVWVLkcLzWjpEbok8ZboHRgBIe9Ophdi2gWMpc/BBUhTq
	RKQeMjerqZ0LsYYHGGphxdr9vn9uWEWG/jDv7h59JuBMShau6roRfzuqaRoTRZiCl
X-Gm-Gg: AfdE7cmfDtDP7BZr8Sl1ApUH3Fyaj/Hi/puQ69Iv2NLeuZbVrrFlLIynvzIFgXR+3dc
	P/x93sB4Z4LX3xSA4+cUAWJN4uFXrInn+KSoHVsbZB+V+LXMLNg8ShFmHMswynUmZta6KjzhX+6
	yzbTm2iSa3uWndReXg46U+dpifrEKPuVNcOPSvBVak8U0bjG8vS5QXT/Nucgz2JROhEWekSRfsd
	0GpRAO/65pKPMgeZtYLlh8jgYixfIlXDDOXuZbpTntgnrDX/pqpzEZtqTien4PskrKWn5NwNIum
	nkIxrHOUrFI4l5S/uepKXvZdPa4aipFHKg1fild4mhXLXQp//59GOcD0O9va3qKzNo1dRmbFk8f
	WgNlRyCsv5y8rdn7WbFiXNxvhIVPrWXTD5qgQNjYGR6lLGwZsoYRV2FuOrPIWhSnG9g==
X-Received: by 2002:a05:690c:6c07:b0:7ff:1a06:472 with SMTP id 00721157ae682-81dbbe3759dmr63673687b3.4.1783608593596;
        Thu, 09 Jul 2026 07:49:53 -0700 (PDT)
X-Received: by 2002:a05:690c:6c07:b0:7ff:1a06:472 with SMTP id 00721157ae682-81dbbe3759dmr63673477b3.4.1783608593194;
        Thu, 09 Jul 2026 07:49:53 -0700 (PDT)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81e7795988dsm4989277b3.26.2026.07.09.07.49.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 07:49:51 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>, Dmitry Morgun <d.morgun@ispras.ru>
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        linux-kernel@vger.kernel.org, lvc-project@linuxtesting.org,
        stable@vger.kernel.org
In-Reply-To: <20260530114252.42615-1-d.morgun@ispras.ru>
References: <20260530114252.42615-1-d.morgun@ispras.ru>
Subject: Re: [PATCH] wifi: ath11k: fix potential buffer underflow in
 ath11k_hal_rx_msdu_list_get()
Message-Id: <178360859072.1031194.307534761156277733.b4-ty@oss.qualcomm.com>
Date: Thu, 09 Jul 2026 07:49:50 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Proofpoint-GUID: 1_vkPnii30BBTf9eZ7xXE1dOYdJplgkI
X-Proofpoint-ORIG-GUID: 1_vkPnii30BBTf9eZ7xXE1dOYdJplgkI
X-Authority-Analysis: v=2.4 cv=GIg41ONK c=1 sm=1 tr=0 ts=6a4fb512 cx=c_pps
 a=0mLRTIufkjop4KoA/9S1MA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=R6p_8CvzZLfSnjKUPdYA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=WgItmB6HBUc_1uVUp3mg:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDE0NiBTYWx0ZWRfXwIoWSv5emJ9k
 9pYZj1QQvOX0UVZ9899uaC94S7JDQ+Okg2bVAMCisRR/wszuFVobbX4uadIVGTu4xh1a+0Vltza
 g3tMRRnar3Uy2nDaGTdQHXK5QxkxdSynVXeGeTfIG2pneQtsCpMPQWLhHoGYNpq/gVxHK5jGjfB
 rdfDEm/kU90O/y/B14QqV0W5VbGzuLgPz4hoFzDEvYIMAPzo+/4pz1/Ehy7BlNWp5mdFwWXXaQe
 lOngpzorb7hHzPBCppIEx9B/f5ku1gTYvYb8DrQ1yHB5bAW+fk40XcPVFuAhMee+0nj9T+Ms7f0
 l+2yfMG5dFXhcHz+r7UUyI/rGt50CRzrdtb2DOBn3vEjw4KTCabqDNv9SSq3JA2mH25sx/vwKSp
 N3TmS8mDFx8CylknN3pkR7VyFgO58ESyws/tu38d/SbgfkH1GKL4bMacmzGnfGAbOZ/OseqA57j
 Dq3FUQaIhSOw3psFCmQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDE0NiBTYWx0ZWRfX9SizvaJ9KTsq
 goUeuTFfMCLdkngSklvhS86GNzs1W/83ByT/Xn7NDy8KdOK9S4Zwi1zS54y1Cx04dyuzOmNiCwO
 pjvXEDss+8ZLwPGbx7q4ssbRPf0AsFM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_03,2026-07-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 suspectscore=0 adultscore=0 priorityscore=1501
 spamscore=0 malwarescore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607090146
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_074955_176342_EF9F76B2 
X-CRM114-Status: GOOD (  10.50  )
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


On Sat, 30 May 2026 11:42:52 +0000, Dmitry Morgun wrote:
> When the first entry in msdu_details has a zero buffer address,
> the code accesses msdu_details[i - 1] with i == 0, causing a
> buffer underflow.
> 
> Fix similarly to ath12k_wifi7_hal_rx_msdu_list_get() by adding
> a separate check for i == 0 before the main condition to prevent
> the out-of-bounds access.
> 
> [...]

Applied, thanks!

[1/1] wifi: ath11k: fix potential buffer underflow in ath11k_hal_rx_msdu_list_get()
      commit: 7f11e70629650ff6ea140984e5ce188b775b2683

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


