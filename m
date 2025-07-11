Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E06DC83F1A
	for <ath11k@archiver.kernel.org>; Sat, 12 Jul 2025 00:14:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iJaNlSK/GbStS7lb9/17BUr8ds+mo5PWyFhZUdAGzHU=; b=KugrraxIiFpS9BxCux6D9rders
	5KrNro/saCiI89acgRtxjAPFP/IQaqGHZmDS+k4qTbKariKm3EugPX3ck+PxjDiYNJVIwq9IE68X8
	trztdqB6Ais3oFFREcyD3/7Su2DX8J09gL7nj1t2LbsZebvdifTKXUMHwZAZ6x21lfFINne6ThmRB
	YuSKdSWCoZOF5kSQ6M5CSFmc8Izo1P+wGKHsS+uQfnAzFg2Y/DB9OHAvi9p24V9UYqJG9PHhFp8Zy
	se0jRM7z8Hwezlr8ZgL8EZHqsYBZoCTWUXIwibVNY6H4QnFLyKXPKIY4Wx481dNL2ifSaT2ie459x
	fpSWHG7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaNsi-0000000G5o0-2st3;
	Sat, 12 Jul 2025 00:14:20 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaMso-0000000G0Ry-0JkU
	for ath11k@lists.infradead.org;
	Fri, 11 Jul 2025 23:10:23 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56BKCgLs019648
	for <ath11k@lists.infradead.org>; Fri, 11 Jul 2025 23:10:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iJaNlSK/GbStS7lb9/17BUr8ds+mo5PWyFhZUdAGzHU=; b=fQy/grzz9xiKmQcY
	a9nS7NT6LgbLz1F96MqwoPoiXvRywypXDx6Sf08cSwryd9uFUVSiYqrOewsHCQ6K
	ZTYKYsQjPHxnBbsnvU2S3LSF9TADqJmEn0byQFJZkdELEI5dbfSpKsFRvr773BEh
	nhtbO+1wzVPcUyf3bkj0rIxAaFy0ra0lNI6u1u988q4kH/DEWPGZy95Vw6GlwYaE
	GbNeMh9C0hOz41mTHqQPMHBeRm8byif+HdRWmxpbx8XOYFgV4ZRLWLjMecQG1CAr
	xUW/C5Dicr/7KlfGcn9lxibMFkT1V13Wt5QPZoG1dAASuem8fVd1/DzwkLSHO6xp
	6+5ajQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47u1c59r0v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Fri, 11 Jul 2025 23:10:20 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b2c37558eccso2172821a12.1
        for <ath11k@lists.infradead.org>; Fri, 11 Jul 2025 16:10:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752275416; x=1752880216;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iJaNlSK/GbStS7lb9/17BUr8ds+mo5PWyFhZUdAGzHU=;
        b=gR4NdFCVlIGj6EfVXYybysNkWnG2dcdAeJKo7NQcfDZkNQ6ZF42Q6MNvdro/+3eJWR
         Jvm4v1l7oSd1gCpFvkxGY3Ha/PHdulZnzJuMNKidmWtQKnCxcF2V1sj3XVkFtC8WStVP
         6+u7ovIG/D5lscXbUZJlTvOdw+BxfQ7Ba/gYoq+Wm/E38FJTgYboeF4aQSZV+LfDw6cY
         +HNY7dRdK8JNN3uMG9iijOveM7MisL9P2JKxyXyNg9ncFuLL5hEXXo34r8fIlGZRYFY0
         fMS3Wa+mIV8PInwbuaZ73D0VorhSVbkhhoDEFinKXVKakqV7a2NFJCbJPoPCY1dr1Mxa
         5j7Q==
X-Forwarded-Encrypted: i=1; AJvYcCW5kycQlBybKUWMcq1ZuHCJiYpOCbGpHKz97K4nJ+PyAMTB2FVFX6PKnSGUrUVKzN2xSI8yIeQ=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy+9V/GYy0C9NHW9dQiymtWyOMTB617VEqkL77DbQrrDilFOnuQ
	GEeRplwf1wg0PmFIeHlqmLJPKaBfZHjVQJMgb8tIIzcPpEFeQy1DVTdV78ySMZJTFL2eUTEL7fl
	AQrt+aqM4R8D9n808IgrVKZQx7MQ1UMXcg2mgSLOfMcAa9Sm0bDyA0Nc9OSY4+meD
X-Gm-Gg: ASbGncsMwdfCG5VYHN2VgVCL24GgniHI1HwDzqL+W7bIBmKfMPq9vDOExCpjdi7e88K
	MYrL6YJG7t5VbCz1fc6ojpuWqSG6UrEroXWN5KzxLIS4zNcK0qfVAK1Q5UPx9qnbXs+JRIYH+gM
	CC+bladSu/j1tKHgp/7R/q5mYw45AJsLivQpJ7xUZKETM/whCA0aD2S6t/byBcKToCkULP5XbU7
	M84rmcPyWA8wEs9q1CAbT0wfMCeb6gSSUeLMe7QrJRK/AaJJBmfqNlW9NAFJExwvaNoTRqK4u2x
	efZSRY2alYNbF5Dg67Sjq9qz6F73QcP7a9apMN0pc0MC7VSf4/+yDGSZE17VMUA94iVc
X-Received: by 2002:a17:90b:580c:b0:311:ad7f:3299 with SMTP id 98e67ed59e1d1-31c4cd9d001mr7043604a91.25.1752275415663;
        Fri, 11 Jul 2025 16:10:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF7Z1TQfgkE3r2PMQwTwfxQjj0gjR9UsVQ1UbIMeevZFsnCWlYfrpvPY3URH71qwyKf5RhBCg==
X-Received: by 2002:a17:90b:580c:b0:311:ad7f:3299 with SMTP id 98e67ed59e1d1-31c4cd9d001mr7043560a91.25.1752275415267;
        Fri, 11 Jul 2025 16:10:15 -0700 (PDT)
Received: from [192.168.29.92] ([49.43.227.1])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31c3eb467d7sm6197116a91.26.2025.07.11.16.10.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Jul 2025 16:10:14 -0700 (PDT)
Message-ID: <0bc51460-f25c-4607-bb9c-0e317e362201@oss.qualcomm.com>
Date: Sat, 12 Jul 2025 04:40:05 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 06/11] PCI/ASPM: Clear aspm_disable as part of
 __pci_enable_link_state()
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Bjorn Helgaas <bhelgaas@google.com>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Jingoo Han <jingoohan1@gmail.com>,
        Lorenzo Pieralisi
 <lpieralisi@kernel.org>,
        Rob Herring <robh@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Manivannan Sadhasivam <mani@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, mhi@lists.linux.dev,
        linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        qiang.yu@oss.qualcomm.com, quic_vbadigan@quicinc.com,
        quic_vpernami@quicinc.com, quic_mrana@quicinc.com,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>
References: <20250711230240.GA2312867@bhelgaas>
Content-Language: en-US
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
In-Reply-To: <20250711230240.GA2312867@bhelgaas>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: BKeizs3ZQJkRhdM6vtDo0dquHD7LUKF2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzExMDE3NiBTYWx0ZWRfXz6xrBl1ZUrqJ
 soo4YLkeAXFivuPKTHIHLCjHPYid0qicLdvXBLfCWwW7VN46c8CtMogd5WqO0UjV3Q8bNIRtTCN
 lJI+8RP8FpzM2s5wjAgFHOcXj8qTvSAYJWy6zPDkWKzX++lSdNWPJDeqBH4LI0KtYyF2wq6uILZ
 678OKOKr1ckaQBYbFIUzijw7psk9nywbscxXe9bA/H+PaY22sUsDiRMqR7PRu4Dwkm2RBqXKNm9
 PiOoHA4JdfOLZp8OEnUekfgCAjfoXmm53nYphmIU8jP+eZsxFxvqNKF1VTDdvo5sh3uBpOLjK3t
 JoNAnZ/J/5MhrCj95ODDSk4E+ho0La3LBywrJUQVBqkqL3Qpz/gzG0JQGGVVwXLrcdZcdUs7Udq
 z3K7R1JOiib2KZ/bjRfxN92Z2WLJdOky21RKxdQhRdWCSb/B/rE48htaGy7I5zwyoCXj52n/
X-Proofpoint-GUID: BKeizs3ZQJkRhdM6vtDo0dquHD7LUKF2
X-Authority-Analysis: v=2.4 cv=N9MpF39B c=1 sm=1 tr=0 ts=687199dc cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=4nqOr+EkFiuPl9GB/B4vcQ==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=P-IC7800AAAA:8 a=nqD_WAsoW_ZkbJYGnRIA:9
 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-11_07,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 mlxscore=0 bulkscore=0 impostorscore=0
 lowpriorityscore=0 spamscore=0 malwarescore=0 suspectscore=0 adultscore=0
 mlxlogscore=895 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507110176
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250711_161022_234597_815B9A04 
X-CRM114-Status: GOOD (  10.84  )
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



On 7/12/2025 4:32 AM, Bjorn Helgaas wrote:
> On Mon, Jun 09, 2025 at 04:21:27PM +0530, Krishna Chaitanya Chundru wrote:
>> ASPM states are not being enabled back with pci_enable_link_state() when
>> they are disabled by pci_disable_link_state(). This is because of the
>> aspm_disable flag is not getting cleared in pci_enable_link_state(), this
>> flag is being properly cleared when ASPM is controlled by sysfs.
> 
> Mention the name of the function where this happens for sysfs so we
> can easily compare them.
it is aspm_attr_store_common()[1], it will be used for all ASPM sysfs

[1] 
https://elixir.bootlin.com/linux/v6.16-rc5/source/drivers/pci/pcie/aspm.c#L1595

- Krishna Chaitanya.

