Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 611A4CAC5A0
	for <ath11k@archiver.kernel.org>; Thu, 18 Sep 2025 15:30:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bhSX98HuJMkyrMaoMiSuQu57olFpyJn5Wru3dPmWuJo=; b=ZDIkZ/6iflojJvwVOw6ZuMa1Ky
	YMuqFWuax6CNfRV8jVr8Abey9313UoiCPc82mq2lrhj6rVZyoOqfDMEscjfFEJs+0+UeNrmnnOicA
	ni7wKC8WvUFXHctOkqBNfKYYrDVx/Fkm5LUs31ADnzuU+GC1P3/R/IPbJ6oAfI+9Pk+8heQw5GTSm
	tHp88PIFU5S0I5Tv4ZbY/YwkKt496HpNl9Q5jf2NdyjvY3O4Di//+dnbcFd+GUxtZ5Iqeqt2H0Rz/
	072yqKCp5o7d6qFqRWfJ/Vd39rrFB45/dYHAUYDtI1GSgegNMBdWfqziyzB8zHKp96X+Yta0hPltg
	lO/Gjx5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzGar-00000000O0g-1sKk;
	Thu, 18 Sep 2025 15:30:45 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzGao-00000000NyH-0j4b
	for ath11k@lists.infradead.org;
	Thu, 18 Sep 2025 15:30:43 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58I94VgV013713
	for <ath11k@lists.infradead.org>; Thu, 18 Sep 2025 15:30:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bhSX98HuJMkyrMaoMiSuQu57olFpyJn5Wru3dPmWuJo=; b=dFi9e74jPDRlKBq9
	wyuv/FewfFCifXgDzVQNKatQxQ/gGqnQVf0D51B/j4e0LDOgDPm6FB9Pf1wHg26Y
	7XtX047T9jmYvLYORZjmXPWzDIuvE/WEAptzPhFj+lxn2J6av7XgMAtof0ThpoSR
	XUC/dPUpYXnV5hI+wCoHNetm43pcvQOKHH/9obHjSYCi+pCBUKFpR+JT73vW85TR
	Vy3XQOpFCKmRxk+ZwVjxLsP58ib2qr8yMc8F98JVXGTvEYNXleDneff21Bv+w9EP
	tQf0BueKnMnV4owOWYel4dgxDEqxKZUGfe+BDnBSscIFwOTFJrkRjXPe1u+NAngh
	Rn26sA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 497fxypxme-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Thu, 18 Sep 2025 15:30:41 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-329b750757aso961770a91.1
        for <ath11k@lists.infradead.org>; Thu, 18 Sep 2025 08:30:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758209441; x=1758814241;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bhSX98HuJMkyrMaoMiSuQu57olFpyJn5Wru3dPmWuJo=;
        b=fyUr64vW6OOt1WMC1qTuIXtE83OwcWgPefiiDZkdPgWFohAFfLfxZJLtxNuXoAR7Ke
         MIxmTmZq7UP53rImLfMF9N1efZnxRc3jg9Wfg1qtEX+MVL/qq2Dnh1gMIa+sgMPgegov
         cV4E5dg4FhLOUkY5+4G+JvcGs1cgUZhhJbA4ZJmXTy9Ht+m6PvcMvdooDUPGOGQadxKe
         aY8Q8iTW4GPCQ9z1oAIjWEYpt1wiTfe4+lu4YbdirMZKjbHkxu/dYkngFgTSBDzO4yO4
         47/rAWrq0MWjVINSD68X6gdMR3cS4xZi2LkC13ccEzT+W9asR74dvhRO3bbvlhpbM/Cr
         wG5w==
X-Forwarded-Encrypted: i=1; AJvYcCWqqM/lLctK9z/BpPFWKtusupF6E16vbKFrq2LH6YVtWG8ZO/5gBmVSRIygZsKf8EBpIQ9H7/Q=@lists.infradead.org
X-Gm-Message-State: AOJu0YwKR8age/R+Q+fPy7Coxh6b1AEQOKhBKoy98LnIq1H2O5Imtkg6
	T4ddSix4QvfVS2LNzG7dnC7jD9OZ+cxvOH12fgaQ1+ne1pOzepaKSXGaONdZtP8z6DfN+O1fLTU
	uw5frVEN7kp1Xn0F1S25Gb99v45AstSoZ3p05nicnaduoBEkI6uv6A3cX56tukZOP
X-Gm-Gg: ASbGncvRSQStuZkZT1ZabQ7jfCZ2gHlhhPeffsM6uSPNLvb1dtcYNzuZZFYfOGKbxF9
	kgW96S+bqc01xlmmjNCdg+aZxLuKlUauWCP+t6p1oZ61iYkDRqPy7IDOL7jMiHxvW+VmzZRaRVZ
	+ljNWr0AnEsOuU99bZT3sf70/G89zH/WYBNcM0WN6NAPy+HUQlh+g/EJjJt6jE+N4uljKv+CJdl
	WrrPwZeSI35BAC6aedsZ5G4r1uzSztSwgDMTwB3+6inWSlIAYs0+tCRyNgUcCmfUIwcpGi0tDeq
	iq9BzTt46xVaAxRp0HnQWF82si2+EW1AG+TsTFkcfMLBOWq0wp4dXNz7+J/K2uV5DqRFiRx6eeE
	0GsEILCSqK/0=
X-Received: by 2002:a17:90b:5590:b0:32e:d282:3672 with SMTP id 98e67ed59e1d1-32ee3f68353mr7443673a91.23.1758209440717;
        Thu, 18 Sep 2025 08:30:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFJtZalFVe+kGAbPWvX/SFNLY4dbFllQVIHjbFGW3Gqec+5jAn3kcNmX6T2JYXIMtSPBWimIQ==
X-Received: by 2002:a17:90b:5590:b0:32e:d282:3672 with SMTP id 98e67ed59e1d1-32ee3f68353mr7443610a91.23.1758209440202;
        Thu, 18 Sep 2025 08:30:40 -0700 (PDT)
Received: from [192.168.225.142] ([157.49.98.120])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3306061925esm2937000a91.2.2025.09.18.08.30.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Sep 2025 08:30:39 -0700 (PDT)
Message-ID: <3ecf5010-7480-c780-1bf7-b0e762bf293d@oss.qualcomm.com>
Date: Thu, 18 Sep 2025 21:00:35 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v3] wifi: ath: Use of_reserved_mem_region_to_resource()
 for "memory-region"
Content-Language: en-US
To: "Rob Herring (Arm)" <robh@kernel.org>, Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        linux-kernel@vger.kernel.org, ath11k@lists.infradead.org
References: <20250813214933.897486-1-robh@kernel.org>
From: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
In-Reply-To: <20250813214933.897486-1-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=e50GSbp/ c=1 sm=1 tr=0 ts=68cc25a1 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=31WDjHDmXr0yx5AvGNnQTg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=VjuCZWrZiTeoWwOd-AYA:9 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: UdIIb5sfQlT-YMN1IAlN1IPfqYt_Pm7q
X-Proofpoint-ORIG-GUID: UdIIb5sfQlT-YMN1IAlN1IPfqYt_Pm7q
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE2MDIwMiBTYWx0ZWRfXw5TIN/NeoqFW
 Yx9vMUwfEWGPW8BDQTgPyyVlFXyU4vO7pWzewRIi7coVsnNPVzxLRcZc15e7Me0etwqxjzsPI2D
 y6PcoK2zAfGsCNQZWrPj30onPkBvnjGaWVv8GDwXduiU+9YN3JtCyaP94ns6HP9G3Jl7Utd/VBm
 eZlhHC49Wc1KgHttc23N0RfoUoQLighoYJaaHYs00+NjiVOe+uUbPB4Jm5UJzwYBCqxRhnO5OZW
 n6mp5XhGZC/cwHZfkWwxUdcos77tUyk1JJ06PLdnfmPVrxlQdRNkHnmkMZ5/VNU9/bYm1zb1skl
 EcyJGg/CC4lsciFAeb24m3WJY4YguIgYnO+oUlM1Du3N247SPCQDKlWlgYq0cCCvekd3q0Vqxz4
 tDScBEwO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-18_01,2025-09-18_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 clxscore=1015 spamscore=0 priorityscore=1501
 phishscore=0 malwarescore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509160202
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250918_083042_222069_7B2E5594 
X-CRM114-Status: GOOD (  11.94  )
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



On 8/14/2025 3:19 AM, Rob Herring (Arm) wrote:
> Use the newly added of_reserved_mem_region_to_resource() function to
> handle "memory-region" properties.
> 
> The error handling is a bit different for ath10k. "memory-region" is
> optional, so failed lookup is not an error. But then an error in
> of_address_to_resource() is treated as an error. However, that
> distinction is not really important. Either the region is available
> and usable or it is not. So now, it is just
> of_reserved_mem_region_to_resource() which is checked for an error.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

Reviewed-by: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>

