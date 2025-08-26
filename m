Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB4ACCA0EFA
	for <ath11k@archiver.kernel.org>; Tue, 26 Aug 2025 10:34:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:From:MIME-Version:Date:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=THXD3tlh8eUkNhfT5PZNJhHY5CcdeoTK49zbedmEjuk=; b=v3FNcVSyOswlTNNW7vnKSQ0CeG
	RWDrNhsyj0ldCmxpkKE8aTEyoEmTOcreX8wQOCVCQpkhvVlDmNraJApcBcn9rdnMPtwBaiq1pA0t+
	txNHpGn8DJ887S4z4u8wWPmmseRNFUlKhvqakhSZPBe8TRM+k+SxnHL3sohnDdMwL2EEWs/Ati5RJ
	VoIb8bm57BYiVQh0nw35KL2ou8lTDdfzywJjJE46IbwOQ4qeDEe6ibQPNXL5kQYED4f0E6jlTqCWD
	/jxrfeU3Sgz8SN/FRK0NRZDmKmZ7bLVzX8efUhYxUTiNzfFexEwc6BllgKjKiMQ7EaMLbG+Rs22fp
	FQInCV+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqr0f-0000000BdaX-1V7i;
	Tue, 26 Aug 2025 10:34:37 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqqET-0000000BU2C-3yVR
	for ath11k@lists.infradead.org;
	Tue, 26 Aug 2025 09:44:51 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57Q8Y8b1027644
	for <ath11k@lists.infradead.org>; Tue, 26 Aug 2025 09:44:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=THXD3tlh8eUkNhfT5PZNJh
	HY5CcdeoTK49zbedmEjuk=; b=g4+QgYUC8d0fGdy5J1db+XMkqGsk83v8dKbpP0
	vrEBj3W9YYImfOLv2+Wo8BIyei98A5TR5lp9jvA9M86MqcGtcUEZml27fg2y0Dk2
	vo3ri2btmuN8mw5Lh4yRN0ZuuKE/J91YsI0ycvr9JNVYrJ//8fMHfZX9lL/uzSpe
	NUAQuUTQ4oJ/I9jAY+YVa4sE9b/TxXLZq2NiSyDm/G2aW6bX+W0/ZrZRj9uBPQ2Z
	xS9sOSrStM15Ko4iRccxLqfpAXVhHkVFX9os05DyEIE1jYiwFUUuiILuNO3EJXkl
	cAl/uvU31ubvcHxGWhEFGvMSxfZsZCx8Y2km9BMOGEkP1JDQ==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48rtpetnjn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Tue, 26 Aug 2025 09:44:48 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b49de53348aso1538282a12.1
        for <ath11k@lists.infradead.org>; Tue, 26 Aug 2025 02:44:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756201487; x=1756806287;
        h=content-transfer-encoding:cc:to:subject:from:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=THXD3tlh8eUkNhfT5PZNJhHY5CcdeoTK49zbedmEjuk=;
        b=KBlPmSKDd24w6IPg22mSfBm0LPq6KMKBJb09bmdX9wTdR8vIk+u/XTGrMGnh3AIQ8K
         TFTCnjJcY5y60N2kDa4u4WNDIU/ykb4IhXy3uWxQ6mjng8xEBiJYlqGpjCFwptcsqTzm
         PU6fLJnQ+aBGN/1L9uEQgAjvkIlOiB/nK1P/AKv0H6VPgdwwcVk2RQ6stP8ei8ATOebP
         0TsliiwlA2I2u2opX1MPoeqKWa/Bl0wGnMVPsGJnr0hpUevy7bljKfJ8DCw94RjvOEzw
         6wO+/iX/HyUJDK6ctwXHeqwpq0e9jKcGRWXqzsFT7QIilOXbiA98YMR1nYvnzBulDbWi
         /o9g==
X-Forwarded-Encrypted: i=1; AJvYcCUj+NUaLLVRixPBWzOnUxjz26UnOzsQrNV8tUFFFs+2I/Q+X2nv88xu0DWI031qHEkbJmuOvjA=@lists.infradead.org
X-Gm-Message-State: AOJu0YyRFxtDk6t0zAII6xv7DmxNKBFolwoq0dUVX6UIMVry9stmNbRR
	MKoZAsDFBuhfCtLdsv/Qufe5jnX6bSitaW1wWKBu0q2ceN7hDEp9iw1UAPsbZLcjLFxe3vG3JYn
	Bcn+8fdbLRtD86mRZpi2q9aq7eKtg6tzwN/AYF0EK8+V0H6MCJ0SV+mbaU4XEjz7w
X-Gm-Gg: ASbGncu0cXd13Rh89Eh5BL19uKkRc9M+ezk2u98ACoX4s2SeIZSctjYEMsNjy1vEXvi
	BQIYfoljtoPXFMBl7dmOVXQ0ZeqQ23jTKTDsIEaa8SgMJlmN9CVWzflTv9yTmC/SZ8rY97Rn/s3
	3QJb8oPeT8QSq0LRw2w0lCp61emhKw1nrnuGwWpnhNvgzPJAsLTxUOWhKITBJXvbsPpnqa/wfSv
	5PcQpj1E3ixzbLVnPQP0cXfk2DBbh7rCfrU0bw2U9iCmcug7Dh0yNKhQJIQUScC2qfqI4+XzCeC
	zYixjL0GZZ+lw2GgW31i/rQJ43mGDAhTqV+5RBY6US4jqKT//lF3wQk8+yRAOIOCH17kx6dA40x
	m8WldXjpbQkRLs1DJAzyxgxo4Bg==
X-Received: by 2002:a05:6a21:9990:b0:1f3:31fe:c1da with SMTP id adf61e73a8af0-2438facc696mr1246052637.11.1756201487016;
        Tue, 26 Aug 2025 02:44:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFvRL2Fy9sI3oGMG7jx+6nF6YDFCIRE8NYEdNTyKm+HWJTBqahFHayZ4KaRSOkfwszakqi1yw==
X-Received: by 2002:a05:6a21:9990:b0:1f3:31fe:c1da with SMTP id adf61e73a8af0-2438facc696mr1246024637.11.1756201486520;
        Tue, 26 Aug 2025 02:44:46 -0700 (PDT)
Received: from [10.133.33.184] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-771f9f289c3sm1329536b3a.19.2025.08.26.02.44.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Aug 2025 02:44:46 -0700 (PDT)
Message-ID: <ff6c1fe6-820f-4e58-8395-df06aa91706c@oss.qualcomm.com>
Date: Tue, 26 Aug 2025 17:44:42 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Subject: is dma_mapping_error() check necessary for dma_alloc_noncoherent()?
To: Marek Szyprowski <m.szyprowski@samsung.com>,
        Robin Murphy <robin.murphy@arm.com>,
        Jeff Johnson <jjohnson@kernel.org>
Cc: iommu@lists.linux.dev,
        "linux-kernel@vger.kernel.org >> linux-kernel"
 <linux-kernel@vger.kernel.org>,
        "ath11k@lists.infradead.org" <ath11k@lists.infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: vOZLEPOKAfkGaXX9kf9o81vjdaFCQixr
X-Proofpoint-ORIG-GUID: vOZLEPOKAfkGaXX9kf9o81vjdaFCQixr
X-Authority-Analysis: v=2.4 cv=Hd8UTjE8 c=1 sm=1 tr=0 ts=68ad8210 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=Q74vz0maYr0LruRLZiwA:9
 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODI1MDE0MiBTYWx0ZWRfXwL1vrD21kigR
 Z9cNTIn4V9BxTzkjTltS4YJxr6UgnmK8zqJzsuq8j/AkvBmgnkypW4TruAj+Gd5cT5m5ZvVdatN
 dvK2Q7CjxamDQICnBnIENfYMI+hMnIjdkQy1I3xwO/AWDWTTKZc3IEFjWLUM+i81Qs4XWEe2Lpq
 lS6pCgjxk69iDbpFgE8cpUZT76xJw/nSLJm0UsBkMRcHxO9EPEfeW/qkXGzXrLw4EqYRdj+RESZ
 6AWTLg0zCUrRlqbUATRBmH1oVaMK++skTz0k9tL714U0VhFqBvWzg+R13Ofqpd61n0bs87BMuwx
 LZHFTcWIhlX9QtpLhzRLxYZD6JKmjYw1ruxyjVWz6chs9Oy2o+m7Fc5Mlbjy1MxGbNuP2w2NLRJ
 vT0dIfFG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-26_02,2025-08-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0
 adultscore=0 clxscore=1015 impostorscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508250142
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250826_024450_116416_0F3977D9 
X-CRM114-Status: UNSURE (   9.66  )
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

Hi guys,

I have a driver which allocate noncoherent DMA buffer and get the returned CPU addr tested:

	vaddr_unaligned = dma_alloc_noncoherent(ab->dev, rx_tid->unaligned_size, &paddr,
						DMA_BIDIRECTIONAL, GFP_ATOMIC);
	if (!vaddr_unaligned) {
		spin_unlock_bh(&ab->base_lock);
		return -ENOMEM;
	}

while free the buffer

	dma_free_noncoherent(ab->dev, rx_tid->unaligned_size,
			     rx_tid->vaddr_unaligned,
			     rx_tid->paddr_unaligned, DMA_BIDIRECTIONAL);

I get below warnings:

 DMA-API: ath11k_pci 0000:03:00.0: device driver failed to check map error[device
address=0x00000000f3ad7000] [size=639 bytes] [mapped as single]
 WARNING: CPU: 15 PID: 64303 at kernel/dma/debug.c:1036 check_unmap+0x7e2/0x950
 RIP: 0010:check_unmap+0x7e2/0x950
 Call Trace:
  <TASK>
  ? free_to_partial_list+0x9d/0x350
  debug_dma_unmap_page+0xac/0xc0
  ? debug_smp_processor_id+0x17/0x20
  ? rcu_is_watching+0x13/0x70
  dma_free_pages+0x56/0x180
  [...]
  </TASK>
 ---[ end trace 0000000000000000 ]---
 DMA-API: Mapped at:
  debug_dma_map_page+0x7c/0x140
  dma_alloc_pages+0x74/0x220
  [...]

Checking code gives me the impression that I should do dma_mapping_error() check as well.
And indeed with below diff the warning is gone:

+       dma_mapping_error(ab->dev, paddr);

However this does not make sense to me since IMO testing the CPU address is good enough, I
can not imagine a valid case where DMA alloc/map fails while returning a valid CPU
address, no?

If I was right, should we remove invocation to debug_dma_map_page() in dma_alloc_pages()?

