Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 772EFC83F1B
	for <ath11k@archiver.kernel.org>; Wed, 16 Jul 2025 17:11:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AvZu+s6FPUG3iM8B2iDP144HoBABMQMyB2lUuofN4v8=; b=bW6lJIcIJTzQAoPxayfngvquuz
	zq64L31MNew28SRRLAh0Uf3fcoU2e6182qzQii6ZAeAdxK7ZzM7rnQiNsFwnJhYWFIpgFOtu3600m
	1ajPfbHMawdogd8DuRhEK+dM31ll4/lXZH+iNUe7paxEEO6vXYe9Cl6kDNSk8R0w0WOArJHClCaNz
	p0Krp7kZyITwCy3qzuF22NogcB/2+jH6OdaVkprDtNERNkSDcNH5WS0rf0zObj1YnHUB+fY8dHHJl
	9IAKoSr9VGXrm5rTAPhHZGWaA9DOjheSRdszn+QArqbSP/GEVkZQrQ2XwFyMhp1uIivyIyVf5xW9T
	RduxeGrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uc5fN-00000008GXb-00dk;
	Wed, 16 Jul 2025 17:11:37 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uc5fK-00000008GWC-051c
	for ath11k@lists.infradead.org;
	Wed, 16 Jul 2025 17:11:36 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56GGDUVd022239
	for <ath11k@lists.infradead.org>; Wed, 16 Jul 2025 17:11:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AvZu+s6FPUG3iM8B2iDP144HoBABMQMyB2lUuofN4v8=; b=lcrgpN0RS21s/wFj
	BA3V9E2v1JVAb0Jubcya9oPGT/MF+0yYlDwuJymmhDfnmwOBvvSZbbRcJCBu1TOY
	8NLV+BAE+cMui13Nej2B0JwpSsfbb4p+XU1HEM8aFm6g/eSVLKdLXMhUan+Wo37U
	LyaF8coJAdDXauV/J+qOph7zsKyDCWH2iAWQGHe/M6upStdCLSQNHLxJHs2xdLyA
	3EyrsJuzQ5fqObKx9gfBbbjcyyVvdCO4R/aO/aN3jLhSi+KVjnO5pgQcPhEFwVp/
	8OZdVTpXIZiVJPZLCb1QIh2yqciql6cFRNZ8xSj9ykqhbeAsK6/K1AvK9BPDslu2
	Z0w+Ag==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47wqsy4nen-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Wed, 16 Jul 2025 17:11:31 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2369dd58602so346675ad.1
        for <ath11k@lists.infradead.org>; Wed, 16 Jul 2025 10:11:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752685891; x=1753290691;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AvZu+s6FPUG3iM8B2iDP144HoBABMQMyB2lUuofN4v8=;
        b=r5sMKBjHzo7kiAuRKMUErbg2FUvULQR6ZWS2zAeZLP7qsZmlAqBNEn4hC+nWH+o2+W
         zEXJlbqFR7+7W0gFwpLQr6RmNGwQts24+ksouU+9buzXHynkETCZbyyDzLsHnvw2TIZK
         kC1mahcCJxfnCLnsu+eEsVhZqB/OJrVCcmQ8qu/J8vuFN7S5ig5p5vifvMlW4zTgIadI
         ha6Mm8IWClzn2r6zGabbUVx6Y45EqXmTP9vELFmjkkMukkggGJqcf+2hhBI7UXoQGsAc
         dd3YZGSwvXYVCDY+RakwLzmXPgdaQ/L4CSraGxpAkY6E4R+iPasJkjK7PhgZztYUgCXY
         JMKg==
X-Forwarded-Encrypted: i=1; AJvYcCWVrv0lEeJoWm6oGel4f9RkUrp6jIp27VdeLrUmJPMBFDVALHnpsZ7uieS7pGQRdZeiP88iuPs=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx5bUuSHMVgT/YetKZmtvC5V1AbKrsf/ZxRLqcMxF6DfWmf5A85
	7HgBs91itYsA722SRyhl2frg9Y5E3MrZU/1wRgWq37RpHppIV/pWapxvTbx7Jv1ZNrVECk81XwH
	YtkXvoBDWL3wh8VdsomkWYIP4vHwXRtuzKPvX9YkCRnIsSi2augCkg30i2edv2W0t
X-Gm-Gg: ASbGnctWe3SVIFwX7dTF1Qp2fanSA7S1FNeLMiPvmnys5QEPKgLmKMw7zYVreqhg++G
	1HRo4nUun56EDhCDwiXKIiWoTZ9tFK87LZSXRz1DLgZEU4WxFK6dmobOcUqlhdKu0SyYoj/Lt6D
	73vopk61XAM0cIg05qEuvFQ/D2sERvuLUb0JUZTy9ZdGHLQArTlEHME0DcrfGsm9Yg7V+soj8mj
	7AZ7zsVt5zLOFYkFcaVIJcgWqAbeHm21vyl9ujt2mT0xVFnA4DECbDdBpjki+QF+ygddqspiDiq
	mi4sAf2kziQ4F2BMAaYh81sSZG/RpC8UdZd96Bd6al8zIvaPv0vniJ1OJsMgS/pl0U922FHXPWV
	wTyu/UOaRmig2uS95ec0=
X-Received: by 2002:a17:903:1cf:b0:235:efbb:9539 with SMTP id d9443c01a7336-23e256b6e94mr60970285ad.17.1752685890517;
        Wed, 16 Jul 2025 10:11:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHCaXQ8h/tJKVUb7+n8ZsAIn5RASnIJXRAkFzeIQw6HcoivPyubiz6hlD2vF/imJdL6JmfECw==
X-Received: by 2002:a17:903:1cf:b0:235:efbb:9539 with SMTP id d9443c01a7336-23e256b6e94mr60969775ad.17.1752685890010;
        Wed, 16 Jul 2025 10:11:30 -0700 (PDT)
Received: from [10.227.110.203] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23de42abd8esm128205355ad.54.2025.07.16.10.11.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Jul 2025 10:11:29 -0700 (PDT)
Message-ID: <f3374104-684d-48c7-9e2d-e97dd48700e9@oss.qualcomm.com>
Date: Wed, 16 Jul 2025 10:11:27 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/6] PCI/ASPM: Fix pci_enable_link_state*() APIs behavior
To: manivannan.sadhasivam@oss.qualcomm.com,
        Jeff Johnson
 <jjohnson@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
        Nirmal Patel <nirmal.patel@linux.intel.com>,
        Jonathan Derrick <jonathan.derrick@linux.dev>
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
        ath12k@lists.infradead.org, ath11k@lists.infradead.org,
        ath10k@lists.infradead.org, Bjorn Helgaas <helgaas@kernel.org>,
        ilpo.jarvinen@linux.intel.com, linux-arm-msm@vger.kernel.org,
        linux-pci@vger.kernel.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Qiang Yu <qiang.yu@oss.qualcomm.com>
References: <20250716-ath-aspm-fix-v1-0-dd3e62c1b692@oss.qualcomm.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20250716-ath-aspm-fix-v1-0-dd3e62c1b692@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE2MDE1NSBTYWx0ZWRfX32LM1T4FuS7c
 /NjITxjloY/5ajNfQ1pYJodepSArM85bzPVIh3mrYlZyv/54fQwHxji3lo/v98/sM0nLjOjTPkM
 AlvFmL2I+9g0hExO3dNCFH9IYEmnFfQY8pnZu6bW3nytJ87eLcbEe2fw0vQnm/1bHx8NNnfOfgx
 JcmfZ7SBhNzG5nInE33Cd/twYy1vlb+e4Wv8uDcmaOQIqExRl4u6q0zKz8Aw1HLfGRur6O0NJhb
 dRKV8ZCVWhPls1hfcK8f5O64XFREeiiw1WItYSyZKHaAirPbPYCGYNxodymJKhRY4wJDO+aaG/v
 dTm0x/Ei+0FYHL6lkGyuQEpcEW7QYioC/+kDPRdq4A88GLZrIk8HgvAIuwKRvyjDKGnQQeqgL/2
 0l/H5dRdGXNicONBXuSC4t6aHWuWgnanfskIHpl61XS1tE5oKd1cjpgG9WzxoWwYEts/ym1+
X-Proofpoint-GUID: LHpcjKXjjLNSykIHUSthbA0CjgEcLnl8
X-Proofpoint-ORIG-GUID: LHpcjKXjjLNSykIHUSthbA0CjgEcLnl8
X-Authority-Analysis: v=2.4 cv=McZsu4/f c=1 sm=1 tr=0 ts=6877dd43 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=rhYh_zIkBfzxVmIspk8A:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-16_02,2025-07-16_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 mlxlogscore=453 impostorscore=0 mlxscore=0 phishscore=0
 adultscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015 suspectscore=0
 spamscore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507160155
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250716_101134_094334_A8BA22EA 
X-CRM114-Status: GOOD (  12.92  )
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

On 7/16/2025 5:56 AM, Manivannan Sadhasivam via B4 Relay wrote:
> Merging Strategy
> ================
> 
> Even though there is no build dependency between PCI core and atheros patches,
> there is a functional dependency. So I'd recommend creating an immutable branch
> with PCI patches and merging that branch into both PCI and linux-wireless trees
> and finally merging the atheros patches into linux-wireless tree.
> 
> If immutable branch seems like a hassle, then PCI core patches could get merged
> for 6.17 and atheros patches can wait for 6.18.

I'm fine with either strategy. In the first case I'd merge the immutable
branch into the ath tree. Note I plan to issue my final PR to linux-wireless
for the 6.17 merge window on Monday, so we should close on this decision soon.

/jeff

