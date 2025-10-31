Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B2B5CCF9E3
	for <ath11k@archiver.kernel.org>; Fri, 31 Oct 2025 02:43:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=68Z9VSXVW6Q2ijW2mYpOsvswNsQdYdo/t5Hc9YHcyqg=; b=2ZBLrcfuMlbF6RuUxTdM23QjGG
	uOkHvm38a/g/0i90seow/88uFDdeJ2fVcrQI8mQk6dOmEN52+sv4Cm25Ofpe4N3R8MBGA54wUQxdI
	T3R+/JarydSVPRDj1Ur7NvL2qYmeZZaq7LDquBfrCQHTPjORJLVQ8BguQ8vL5PcHA30QQ7QrQywbQ
	c/X3K58MpL2wUAeL1VD3bOEiMIyE2moxON3nGrdLQr2ytsNkBzXAGjwSlvfnymSIWk6JKPx8+BR1w
	mNJqiyroTptnuCb5qdXpC6RDVM/OLoS6TXKkv8l7ubfbKJTYa6ONC6eeNHsx3Ydy6ZZBSMRtWH3hY
	pfDeCwIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEf6v-00000005HQ2-0C4o;
	Fri, 31 Oct 2025 02:43:29 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEf6r-00000005HP9-3Wc8
	for ath11k@lists.infradead.org;
	Fri, 31 Oct 2025 02:43:27 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59V1nEU31572197
	for <ath11k@lists.infradead.org>; Fri, 31 Oct 2025 02:43:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	68Z9VSXVW6Q2ijW2mYpOsvswNsQdYdo/t5Hc9YHcyqg=; b=ZdHArAHmdokDpyAI
	BcUnFzOVnocHZ0l6iFFgt20WVf7euk4DQCYj73ah66fPxLM2r9fusut+bu0jk6Va
	QJW9sYbPNdInzCgjjZbsFucqlCJZbRFvNugfETZQWi83ivkazzKUAkRdyRJn8f4Z
	efaqkpo5EGWZ2fN8rsxkFke37nHM3HQH7IR/GN+mj73l9wp28y1hxKI6A2JsP/6X
	OEbbx5VjW5+9nSs7LarRxK8x74sBBws1+rV8a8f5I/9Wff81q/YcqSpfzRcleGZd
	IBDq1XbZjHAAMOwX2iRwk+FCGSoFrEJcXVHwItXDXn9CvTUVz976f1EHLllFuBur
	WNZTRA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a4ksc03yy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Fri, 31 Oct 2025 02:43:24 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3407734d98bso926567a91.3
        for <ath11k@lists.infradead.org>; Thu, 30 Oct 2025 19:43:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761878604; x=1762483404; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=68Z9VSXVW6Q2ijW2mYpOsvswNsQdYdo/t5Hc9YHcyqg=;
        b=YlppqAZXXu7LXKES3i4xJ3zV7wYgcTJ4ieBBHFD6xqiSxAbxY+NpYyQf2aNVn6s1n1
         MOuxXTx6NtqMiy/F397HH0AcG4H96RdsVvPx+/20sCDDme13+mPM0eJdJ7wYtykUdoL5
         NRZYZwFVTh6PBgDOD7SrwpQEfSGtf7WcrqXvqUBDVt2cYhVVdTGWroWVLKMBGHteIoNa
         x23CzzLOZtloafaS5yw1EwOo3+Zb0fz5K3ZVuMPDjCIdeiqkMH1lWrl8+Yto4tJpj0+X
         f0eeFSlfOPK59/xAam+5t/ceDCtxw2lKceYhI1glYmWXwXn1L3XijfrJXUdTz4SO6Xny
         XHxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761878604; x=1762483404;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=68Z9VSXVW6Q2ijW2mYpOsvswNsQdYdo/t5Hc9YHcyqg=;
        b=niuwvDhj8sLNbyXEwcKTs0c+1uxkLUfQjPNRUP6FPxyjG4C9AZf9QaMNIMDFFdLzAN
         in3MXhrzwsaI5DB/hKqUAM4T669POHFsXxTV25A8pBfIVCy8B7FzumYTuCy9Ac2jXl/n
         bkdh6odu9Ds7CRZ9zzftQ2uV/lSbHvSUyNExJoonldAohAY9RxcALg6uq1l1rUfI0PSI
         O6+29yM8mHKsC/SHpt4/bPu5+PqaRE/GfoBs9RhHe4Uep8KFpm4IqlHD+tOK358f7lQQ
         H4WDu2LvQDoDgxr+ZA6vXt2m++i/cp9pPic05c1bEXmOwroXFkhXnAGPkPG0UIfsOjo+
         mWKQ==
X-Forwarded-Encrypted: i=1; AJvYcCUKYcJ0ZWjJ9XqV2HrN+O+LBPoWOvt1AXGjBfJpygj+1yI4POqujpQ2VUEgoV7uAYnd3ynhRDA=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw3EuqlbdeJEIMy1b16yQXQTGKI8D7fsJ6IMabMrdkKyvPWPlYo
	58cKwRZv+TkjpwjcaEjAInyfK3LSdHxzX4DcfeSg0PHiwx4O+D61oE+5iHvYiHw5HIqKjgvQDZu
	qWEWnASglH27i5lWyJEeJQ0piaZcw0B6XEL1v5YSNTfnamTBbgb5T5+huRiLPk1taxppxMPfEML
	o=
X-Gm-Gg: ASbGncv9gskAwB/XjlGSWPSG+4XcvYpwF+c0TsRDBpR/2Xh0eSn6X81VBGjKoq1y4rP
	3buOqxz5mnOxN7ultHXvXlfKLjVYtBaTzUf+hYV+iKiXOazL6w5oXgwWRkZrAOJ5AV0wsM5hWIS
	faxiQXi7gMxvtXZQgzCIwxhVxs6tf7FtU+qD8WswyjiCpogvH9d+vTdlqndZjpChMh//HW+VyqF
	SRalwKKMr83bDsFgv39Hxcw+4xghCnVm+xAZTS57NpUgNV4trFThVUArrxf0RLKDqTwylMjcp48
	6sysOK076mp/w4QedttOiXeQDF1Oq8sanZ5g0PVEHf7kl+JDkZ9KclA3H3HTPJNjXQ1gL+Ujsi2
	MM7nsKEZFX/5/bxkJLsZ5L3qNyIMmWugQ7xP1gDJbpqQy/P4sXBhe5HDpSQspgfF+hh8+BkE=
X-Received: by 2002:a17:90b:3c05:b0:340:5c57:d00b with SMTP id 98e67ed59e1d1-34082fc3dc1mr2586372a91.5.1761878603589;
        Thu, 30 Oct 2025 19:43:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFuvmyhPreqEqyhgrmhj2nI1Gs4vA99T3cAVTW6zl/IO9uqi9s1AbPjZp+LJPV24OQB1Vh95g==
X-Received: by 2002:a17:90b:3c05:b0:340:5c57:d00b with SMTP id 98e67ed59e1d1-34082fc3dc1mr2586350a91.5.1761878603119;
        Thu, 30 Oct 2025 19:43:23 -0700 (PDT)
Received: from [10.133.33.51] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b93bda59f56sm360095a12.21.2025.10.30.19.43.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Oct 2025 19:43:22 -0700 (PDT)
Message-ID: <0b4ce00d-78eb-4b5d-88b5-7d5b8de663a0@oss.qualcomm.com>
Date: Fri, 31 Oct 2025 10:43:20 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next 2/6] wifi: ath11k: Register debugfs for CFR
 configuration
To: "Yu Zhang(Yuriy)" <yu.zhang@oss.qualcomm.com>, jjohnson@kernel.org
Cc: linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org,
        ath11k@lists.infradead.org
References: <20251030043150.3905086-1-yu.zhang@oss.qualcomm.com>
 <20251030043150.3905086-3-yu.zhang@oss.qualcomm.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20251030043150.3905086-3-yu.zhang@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDMxMDAyMiBTYWx0ZWRfX5oWgm/p8FThr
 8C9BVypyHyDfB/iCv9Asimcup9pe3peBIMbJPt6lBBWjRzcae6BCQ0EAOVmbkTjD7A0Ajw2lxVv
 TRAJJfwTXlRSqWLZOyFgiviI4sSNZUkHjIdIH5Tx5fAAMe8fJYv202ahEnhbM45yYjCK7cM87rf
 +kVF+ZLb9KeUFBPJYGVhHnQM3XOe3L/5FZWV3QR9y8QRNPZr9AUeKwK4Y2EBLR+F///O2t2Jist
 ebqD1Tu+9M2jNaThsEIkFA5oeHadywC5P1LoV6cDw5DeGNwq2MlHViBaiK5VEEhtcr0APHfVqqo
 v6Hp8EFonhIvXmM5ja9wbfgi4tYaSih5LHK/4zxBlPt8rAL8OTLIJ3c1LeHAD9WRu/11wxWsaPd
 g7IoahqTukZGp2qoX3qE5y65JzEA/g==
X-Authority-Analysis: v=2.4 cv=Q8PfIo2a c=1 sm=1 tr=0 ts=6904224c cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Xa9_aeIGFnoHwIuu90YA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: TXud3uknVdSR2KEPDWA_IuTHlSkWmO7w
X-Proofpoint-GUID: TXud3uknVdSR2KEPDWA_IuTHlSkWmO7w
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-30_08,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 adultscore=0 malwarescore=0 suspectscore=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510310022
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251030_194326_005767_72A8542E 
X-CRM114-Status: UNSURE (   7.36  )
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



On 10/30/2025 12:31 PM, Yu Zhang(Yuriy) wrote:

> @@ -88,6 +275,7 @@ void ath11k_cfr_deinit(struct ath11k_base *ab)
>  			ar = ab->pdevs[i].ar;
>  			cfr = &ar->cfr;
>  
> +			ath11k_cfr_debug_unregister(ar);
>  			ath11k_cfr_ring_free(ar);
>  
>  			spin_lock_bh(&cfr->lut_lock);
> @@ -140,6 +328,8 @@ int ath11k_cfr_init(struct ath11k_base *ab)
>  		}
>  
>  		cfr->lut_num = num_lut_entries;
> +
> +		ath11k_cfr_debug_register(ar);
>  	}
>  
>  	return 0;

miss _debug_unregister() in the error handling?



