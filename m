Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94416CCA470
	for <ath11k@archiver.kernel.org>; Tue, 30 Sep 2025 14:48:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zTrFqo2G5X3RRcNV8uDspTf6uHtkQQZrnEeBFh6o8ZE=; b=szhV0p5QAAS0QUREZ6BGmRk/wb
	4silCwUkTMdf4XaZJ9ZkLDGBuxjzfER/BCKGEVwCUeirZDPupYhHTTO+T64FbPg8gWhZmypwUUVno
	S3RWkaDXhrtCMmTj3GnCBnuRc67K5N9m/LcBN7jaS2ppl3gHp7bB2ooX3ZLNTkAiJjhWaJU+RlOF7
	/zQp+7UgypjFiA56OpMNkh79Hsh+GMS7n+xEkzRYBBtv8sVYAcV4hEFAL876Y1Js6Lm0Xwy+5qHji
	bvKsHZWQH0S65+eBg3J42cjb3kx9a4GW1NuHCgOmLdPyEMiE+tz+gV6k+f1xa281ZbFFIYSV9ipKa
	pj9PEmwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3bep-00000005YAA-49V6;
	Tue, 30 Sep 2025 14:48:47 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3ben-00000005Y8Q-2Nzu
	for ath11k@lists.infradead.org;
	Tue, 30 Sep 2025 14:48:47 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58UBtjqO020359
	for <ath11k@lists.infradead.org>; Tue, 30 Sep 2025 14:48:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zTrFqo2G5X3RRcNV8uDspTf6uHtkQQZrnEeBFh6o8ZE=; b=OLW+vJ3PkP4DFo2X
	v3s4vRj46NR77kV5BkVY5NYB/yumFOYsGDoIurHo95tDEWs4y/10eGrVc5av8ti7
	XgA+ZOf3cvccnPAAT5g5UA5TCakjihfzbnVzDZB3sj4+GPZ/iCZJEGFSj2tOOQYv
	2FEAoh2QtXuwmFCrxfybGuYx9OkBkXZFNUrbeLWDLuHIDrIIUdh46UP/GlHcDHJQ
	TbK3nFUGnaoVNN89N6vkqIs1FsWXClu4lVCgP5EjgKJw86YPn6ujQYUBvGur3luP
	jCqnxxZrctR1giUMs9D4+E+NxZ6ESVwj+jxbyRqhCEM9ndPH88d3sj86YW58fPPc
	XlEEHA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e6x5sdqt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Tue, 30 Sep 2025 14:48:43 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-268141f759aso58034265ad.2
        for <ath11k@lists.infradead.org>; Tue, 30 Sep 2025 07:48:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759243722; x=1759848522;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zTrFqo2G5X3RRcNV8uDspTf6uHtkQQZrnEeBFh6o8ZE=;
        b=KY6OtnL+Ya0BepacvwO3g6395LEiflwgAedw1n6ykYUCAKnBck9j4xEhMQrMlM1usK
         9YnQ2hp50hxf6EN2vprK8PbR9nTN4waYBsX636eUIxYnb4afZ4E5JHGWknLok42qbMIw
         KkFV+IDVaMBN++zksTIX1V7ZJwZybHQ7ZKqIkswFQMXPTYQf0trv7Cs0u4WYCsuec3N6
         C5FNIbfmjR1k9ZLTs2bpJTPfmv8zw66LyRkfxYy0BEmCootyLlWkGkOK4Ws3tea5HPU2
         h0roT+apXlpFJByvpqhHkKYDS8zXoT1wxxvxpyLv32ZxY9+Ain2So0AViNxENtJdufOp
         n1+g==
X-Forwarded-Encrypted: i=1; AJvYcCWNyHIeYeGeEC6IewQoNZHgtHnghhyp9gBVx7ZwWUDqcrrhZlMBhFYrPCVCh9urx7Uspxn2nMs=@lists.infradead.org
X-Gm-Message-State: AOJu0YysrZ0jUr2ilb1GOy5cpmw26douBv+YsD5vmGGfFmHKcZPnj5KP
	hyu2khz6MiHhQGSiC9q+Zw3Ea0SdtnuuPtD+fJY4Ca3okaWVjFXBOvjKAKIpnkC02NVqc8DjgaF
	o6elHWGheyxjTY2IG9QQMDeOifEnJOudlfWvILQ6mIy/1xqQHur6h+2em7/fHzDP6
X-Gm-Gg: ASbGncve7Ci3b3dhD12cXuAkR/epnoRNs3cQm87J1qnUiV9UeIxRMo9pRU0VeKdqVp3
	zFOR3ty2UQd1y8vhffpElA8uDTevqTTE3igsewii2K1AiKkz8jtPG6/I+ZTx0GFipY+2QM29wka
	wMCvEgNeq1ReWNzsJ5Fvb5sreryrYL3HAz7UIbNVoNhw5QPsIEqH7U9kQnjfDnTn43V4Er4cEWf
	vMBavWsnPcPFusTejnbGsYBQ033P1AERqiCFwcpGyL+AMX+PLtXp76ptOnkk1VeDFGT32Bc/8vp
	XeYonnYRYXYlccwhxKjoo4WCBXCvUckVbU3OsLV/pBeiVilqd1mBdio+ePTI1uO43kyct5DGWfN
	x2QJki2mWutoVOgn+2vLwpNYLBtWxjYSBwiS9FlkU3g==
X-Received: by 2002:a17:903:32c5:b0:269:7c21:f3f8 with SMTP id d9443c01a7336-27ed4a31641mr244257455ad.39.1759243722166;
        Tue, 30 Sep 2025 07:48:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH4IzyIN9n4Q/kQArD8ugLcGVgKxYLLIRgU/ERTMY0enbO+NarkvMw4yNz1KuniTn2rlcIqqQ==
X-Received: by 2002:a17:903:32c5:b0:269:7c21:f3f8 with SMTP id d9443c01a7336-27ed4a31641mr244256915ad.39.1759243721637;
        Tue, 30 Sep 2025 07:48:41 -0700 (PDT)
Received: from [192.168.1.111] (c-73-202-227-126.hsd1.ca.comcast.net. [73.202.227.126])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-27ed670b315sm163012895ad.40.2025.09.30.07.48.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Sep 2025 07:48:41 -0700 (PDT)
Message-ID: <13eeceff-9f2f-4673-8d23-eb439a687531@oss.qualcomm.com>
Date: Tue, 30 Sep 2025 07:48:39 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] wifi: ath11k: Add missing platform IDs for quirk table
To: Mark Pearson <mpearson-lenovo@squebb.ca>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Cc: jjohnson@kernel.org, ath11k@lists.infradead.org,
        linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org
References: <mpearson-lenovo@squebb.ca>
 <20250929192146.1789648-1-mpearson-lenovo@squebb.ca>
 <83de6105-ef4c-48dc-8960-430893ae253e@oss.qualcomm.com>
 <eddb5c03-e919-485b-a6d4-06485cd87db9@app.fastmail.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <eddb5c03-e919-485b-a6d4-06485cd87db9@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: SMyu34-MgQ4QO6LEhxvE9NX6nAUjDmWu
X-Proofpoint-ORIG-GUID: SMyu34-MgQ4QO6LEhxvE9NX6nAUjDmWu
X-Authority-Analysis: v=2.4 cv=ZtPg6t7G c=1 sm=1 tr=0 ts=68dbedcb cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=e70TP3dOR9hTogukJ0528Q==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=wRxfcatdMthqClwbIL4A:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAxOCBTYWx0ZWRfXza/yfTyM5PXn
 H9n9ikVtoiPh5YOhdKJxrmIBO1sa/oQb6tUUujGhezcFWLCyt/ClDXXq6lqLnG60ls+8e+lIqD+
 vlbIW/WuboDHBuqNO86JeRJasomCn4VcsIeKizKdrRyKfdUVtkviieZIaMmyzWKjTFkImEcSCm+
 vJ+Su98IeSCry/ARxYuET1yztYIX8+tW8BLnxu7TC/VlHzZhHACDmeyaFJ7+jWijXUkTy9xeniY
 UbYHwZVG2zAW2C8qX0IcMoZmsRYMhtn05H0Byz7Wk1EksBX/DxXZuiO4G3Jjw4Iq5SQiFejeU8Q
 kkgVF4h0tDW3nwUMxWwOSxTjfkE/4nU4x1I9MZ8XunYUUvrHnNPogjmQkK9rjI0fkKEYF9yEzhr
 /aW/PlsOJt9ya5XBoFF+TlM+1Qgodg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-30_03,2025-09-29_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 priorityscore=1501 malwarescore=0 bulkscore=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509270018
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250930_074845_728353_4E3BD6FC 
X-CRM114-Status: GOOD (  11.38  )
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

On 9/30/2025 5:05 AM, Mark Pearson wrote:
> On Mon, Sep 29, 2025, at 10:17 PM, Baochen Qiang wrote:
>> On 9/30/2025 3:21 AM, Mark Pearson wrote:
...>> assuming Jeff can resolve above nits ...
>>
>> Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
> 
> Thanks for the review.
> Jeff, let me know if you need a v3 with the small changes.

I can address those in 'pending'

/jeff

