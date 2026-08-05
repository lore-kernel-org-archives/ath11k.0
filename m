Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BD23C55822
	for <ath11k@archiver.kernel.org>; Wed,  5 Aug 2026 09:51:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1IU+TsuZ564fFaBd33xIc9jlaZuK+lX3HGJbEgaHb8g=; b=h0z5FpNS4hKrhTrkbhnebUWoI6
	yAxUtIzy9uVrMZ74fcvekvjpMUS4AmmQbi9cA5IOVuxT1zhOUqWOVf5N9/X9O/I7x8VwSYCigsvl2
	NJZXjrFLg9G1HG3zl1DgUpIwOSFc/OBMziouCICsg4kdoctky0Y8fXYCcWDoFTibvxE/ur71bYbbs
	rxScvy744pTPUuk7ebia2CnKoPVLTuHA0ENkjy3hOmDT10csQ4VHyN7vXEwidN8W75VNYvpYyfHQU
	0ywt+KA8rPvZTtbp7lmkj/qfQcr9mDNp7R+nQRks5mn0fe4DBdAScctNXGXs+hGCFiv/pPeBhRs34
	GbP+l9gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrYHs-00000003fJ6-11zX;
	Wed, 05 Aug 2026 09:51:48 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrYHo-00000003fI9-29oK
	for ath11k@lists.infradead.org;
	Wed, 05 Aug 2026 09:51:47 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6758dDk12132439
	for <ath11k@lists.infradead.org>; Wed, 5 Aug 2026 09:51:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1IU+TsuZ564fFaBd33xIc9jlaZuK+lX3HGJbEgaHb8g=; b=meZ1yApO36DwW3G5
	W2RlIfPaGWXXsr4/9NKjL8wrNqrfq9z2iBHeeWFAiN7OGo9zFg45utFeNQ1LWqxH
	j5474T9+wznaWwdvwrmiAuBUmwgv8lhoqIesbIYS3m0ETKWcu8CGQyVwjAtHFF3j
	mJwJ7ed1XCMqa/cJISRWGHUsQYhgrktqgqcZc8/Es2RYT+cj9sRAGMOnPDCyz70w
	ATWfBb5T8OAtU5LN/8J7dDSRNaaGz1sn6QIE8jzJOEq/nsNuds5FoOf6/+OcxNLq
	S6cGpQuFazHVYyiKvmMb+H1osRPA2WEg6tmHeGH09Wt++dBva5kBujlCXGehrYLv
	8RymtQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fum56bx65-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Wed, 05 Aug 2026 09:51:43 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ce7dfd33ffso10360505ad.0
        for <ath11k@lists.infradead.org>; Wed, 05 Aug 2026 02:51:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785923502; x=1786528302; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1IU+TsuZ564fFaBd33xIc9jlaZuK+lX3HGJbEgaHb8g=;
        b=jMbxZZvvuPFuH1LCmfgqfA05rCe9h5NjaXLZ3OHuEcZmJ2EoBi3LdKqSGaxzS/TAsH
         f4JHqqjiw8zpMqr0HvSR6P4KyYVQCT0Q2QSi54bGG6QulmQWvRY00LdqwfJbRC8FpOdL
         q8HG7+REvFZQBdScvpRgbFPge6JsUATOyC/QEYrAWOKHxpqWaUc0q53mxKEAE4KLthhe
         JWYFpQPHEU2feoxWBvjKb4AAy8W0qL2uZDoB++gCytP7pi0CNNQYN1rRReOP+3wZ/ViW
         ldpidg1xGQUaziHVyUB2DEJVain9Af05rpZKwwQNszXp/Wc6JJxB5fYrw/n/X24t7Kco
         PvrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785923502; x=1786528302;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1IU+TsuZ564fFaBd33xIc9jlaZuK+lX3HGJbEgaHb8g=;
        b=DE1z9N9FA5W+vnkyegNPVb6KwKKM8Snx1E/ZWXRIjz/cL5pSLK5gcXR4Ay3dph1F4R
         VM2HuFRzacweAY3yS7MkEt6IrY303UraE/v/oIsXMBpsz4ARJeDAn4FLSSQZETGt07tc
         wPkwI3egdfDkQjOQ0fucwn3vbViujmu2pVxHjZbdKZc+ABRBmJn5AIXeAXGJixfrJIV/
         lKMf4H0hZKkca30OxcEgJ4p4NJrAY6KMaTG6ojQKvVd/8fU8FCa4zp5B30/tGPzkKfym
         TsA2UMPCeSOWNufs6849LiChCfVSwX+dw/DHnhkmh5mypy2Sd7hJ9MiHnuSCkWcxjXoB
         JTow==
X-Forwarded-Encrypted: i=1; AHgh+RrmVSMQ+pChRossaH7L3zlEWTzNk1Gauzfjd9/to2N4p4qIKepu+o2rRaJDurkEqyY1X1AZsVs=@lists.infradead.org
X-Gm-Message-State: AOJu0YzS2xTRFoiVc5wt2P6m3fZDQ7QTgnMh0SluRqaJXW2JBVwOWby3
	TTCUIHMRiZ/UxQbdznHJQO0wZiShtdsxdfYTsoJETAxs62sJjtX9LvPqdX6w+naVuev7xGEa3JN
	XNFJ37Gygarxah7DtQrZU1KJAZ1VSr6P7O9t9ox3yJWwanUe2JELaTYmqkbHWaa6F
X-Gm-Gg: AR+sD12CPAyuyahZ0QjiXoj4XW4zGN/MyoiOS9Su7QJdjHM/jvJ/N8ZryGKvsk9nKmV
	gQ0dGry51gEkdw8lVi1QYIQRFSeSTbmsvHXH3YEigD6HGuEeEtizSY/VwOs8plpfkmJ0Bgq5ml1
	viz1wJv3kzvxvui3cNLrq5L1gdGQJ+dlQw8fQXVJaBHOmyDm2Q6HCSdLWm1ip5oD5qihWxtdMJA
	n3ue8oKq6Xvja1xqhbM3luDDr0MWplFfkDBdKqQP8I2FG7wNkGvu2xdWj1cyONOD4fWxc0JdiVB
	+ltVjLOZVIedJcGyPeDWh2/VZP8VUBX3au5a233pVJXAjaKwtEhnZ6aMfGDxnsURbQPm0SgaFUp
	m7LGWrTjEWZtJ8ytgH36piwQrAG7pHG9eivChkdwT
X-Received: by 2002:a17:903:4688:b0:2cc:f5aa:9513 with SMTP id d9443c01a7336-2d0ca7fbc9amr66562525ad.10.1785923502442;
        Wed, 05 Aug 2026 02:51:42 -0700 (PDT)
X-Received: by 2002:a17:903:4688:b0:2cc:f5aa:9513 with SMTP id d9443c01a7336-2d0ca7fbc9amr66561995ad.10.1785923502033;
        Wed, 05 Aug 2026 02:51:42 -0700 (PDT)
Received: from [10.152.199.23] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-315867d7e4csm14825638eec.31.2026.08.05.02.51.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Aug 2026 02:51:41 -0700 (PDT)
Message-ID: <63a41170-b20b-4a9a-8d60-12d2226e2f76@oss.qualcomm.com>
Date: Wed, 5 Aug 2026 15:21:35 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] wifi: ath11k: Fix possible memory leak in
 ath11k_dp_srng_setup()
To: Abdun Nihaal <nihaal@cse.iitm.ac.in>, jjohnson@kernel.org
Cc: nathan@kernel.org, ndesaulniers@google.com, morbo@google.com,
        justinstitt@google.com, linux-wireless@vger.kernel.org,
        ath11k@lists.infradead.org, linux-kernel@vger.kernel.org,
        llvm@lists.linux.dev, baochen.qiang@oss.qualcomm.com,
        stable@vger.kernel.org
References: <20260801114911.91483-1-nihaal@cse.iitm.ac.in>
From: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260801114911.91483-1-nihaal@cse.iitm.ac.in>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA1MDA3OCBTYWx0ZWRfXzuy1KGXLqcAh
 tdOQwwvA1sHWGUeK0NiMHe5mIg+b29R17zlM8U/owY8oHSSDEVWprjpMafb4o2foY9vUL6ZsjTK
 c4Q8vvVXTF4TxF3xfqIIssdX+LMYbYIRI/KIvknj/BHwyMKFNQwChSP61vk0TtfFEmhd5X5AkMR
 xPzaqrz23A+RHcbWpgjdo2HTfrsnvYTsxxwZU5NlbiI6V4UGZKHNhzB7gWS8ZfNPeMXaikZd1M7
 fLUAcdPrvSgEJhU/OjuHxrGed7y5bR48+UaEDqdjLbgGDvCQwWQ+IWbi7Zv7RSHOegIvFPfSTHQ
 Vrgb5dh2Dxg3kExiuoR5uqSI2ZyjFm1CpC7ad4BAEa0kgCsfa+xWUax4hP4QqU41yvyEJRfavVT
 eENwpuLyVq6OUsw9uGNRY7GR+r9zHCvEdThYk72cILD5Pj8BQ9+UveFYFo4583x/dVrgZnM6ul7
 8FUGcPbDdf8UNVWHzng==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA1MDA3OCBTYWx0ZWRfX9lF4p8drTbNX
 Nt6oZQl6RBw42F3ggLroKnyeIbGlma6KPzsVaFvqMNzMyN9AWz/nnRZ9m5flzHV06byByx+UTFm
 xW5gidZlfVl+wAUMwL62T9EREGV0lOc=
X-Proofpoint-GUID: JoC6djAJ3XtmwZStKpTS0QPMcEspW2Xe
X-Proofpoint-ORIG-GUID: JoC6djAJ3XtmwZStKpTS0QPMcEspW2Xe
X-Authority-Analysis: v=2.4 cv=GL441ONK c=1 sm=1 tr=0 ts=6a7307af cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=i0Dr3GctjLOm-fFF1aoA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_03,2026-08-04_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 spamscore=0
 malwarescore=0 clxscore=1015 bulkscore=0 adultscore=0 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608050078
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260805_025144_671028_097BAC15 
X-CRM114-Status: UNSURE (   9.95  )
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

On 8/1/2026 5:19 PM, Abdun Nihaal wrote:
> In ath11k_dp_srng_setup(), the memory allocated for
> ring->vaddr_unaligned is not freed in the error paths that follow.
> Fix that by calling ath11k_dp_srng_cleanup() in those error paths.
> 
> Compile tested only. Issue found using a prototype static analysis tool
> built on the LLVM compiler infrastructure.
> 
> Fixes: d5c65159f289 ("ath11k: driver for Qualcomm IEEE 802.11ax devices")
> Cc: stable@vger.kernel.org
> Assisted-by: Claude:claude-sonnet-4-6
> Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
> Signed-off-by: Abdun Nihaal <nihaal@cse.iitm.ac.in>
Reviewed-by: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>

