Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4ADEE784A6
	for <ath11k@archiver.kernel.org>; Thu, 25 Dec 2025 09:54:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zPoJzn5MnVIeCWCGvk2Bfp5U8ncISIr0hUiVXJGS/dE=; b=tEmkEGD+QPqyK9wz8/cfHxzcIK
	3Olny6xE1BYe45D6+CjllQeyE3rVjqWSbFXPUSH7HzVOHDJUc1xDE6nxbAwDnwBBkaTJhFMFU9V0C
	zvJ7kbH6FN9yPslW8jSCp/0UD5v2COZ0csZ0Aj559txHmUcE5q7lUERPZk24m+PknQv0udkM61O7Z
	2+S6oA96XYm7MYDfOc0nPNhQoQx+nB6/6GwxPvCNyOylbXo5FrXvvUk1wB3iBqWq7HE4GpP/E4eHh
	xLMhk3QRCd4xnVjrwFAyy3PyP77mU6yzvaLVfYFQXcxVwtWvsa9lgI/8xZXYc3X7H1AL8UWsgv01b
	sF3Ut5rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYi2g-00000000Ibd-0gXP;
	Thu, 25 Dec 2025 09:53:58 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYi2d-00000000IbE-0wiW
	for ath11k@lists.infradead.org;
	Thu, 25 Dec 2025 09:53:56 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BP8cFoY2190841
	for <ath11k@lists.infradead.org>; Thu, 25 Dec 2025 09:53:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zPoJzn5MnVIeCWCGvk2Bfp5U8ncISIr0hUiVXJGS/dE=; b=TE2v60XH1FUKvUz3
	ds+7IcAvHSq65cJ0C35k87Gp8aDp48NolclJFd/lBbOiq9iGHNOrssSL2LqItN5L
	Ugk0+q9nPkW7+E/N8d9WqFJZs4C7z1aZh+xgTpoCARlr9sBFjS31NGHFnjwDcabF
	77V7B0bTDGroLypC63r+t5r12ll80ftsTLkfl+3RbfXxdfCS3uG3tljs0NsEwrkA
	O+3OrFOdnOXBU1YjeSyulD0sqUNC7UWiQapwc7XLECC4r6BIna8o4zMrFPFrrIAf
	qCV+LvmYBExL6+dTk9vRceXcRS2ghVWra9M0XQnJtB5vNytpAFql96vYEhjWT5iN
	jL5vEw==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b8xvc8e8s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Thu, 25 Dec 2025 09:53:53 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-7b9321b9312so13464909b3a.1
        for <ath11k@lists.infradead.org>; Thu, 25 Dec 2025 01:53:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766656433; x=1767261233; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zPoJzn5MnVIeCWCGvk2Bfp5U8ncISIr0hUiVXJGS/dE=;
        b=bO1Dbx1mIUpSoJ3A6AWNsKcXvkFuAmPytL84PVnyDzoIRZI2MrRwMlOUpob7D/3und
         zcxu0KmUb7CvRucxXPnZmfEdsupPMTtbX7cM9+vxIwgsZANCyO40oY0TDdjOF/M6z66p
         KhyvdPkWPf7phzgTA5gQzj1l3shtdd6YzVzaAH6RcwVItfgM6zQ4PRrsIDCMhE+gcmbm
         SWJ/0rtmOQTz7UbnddclKq9yhN6OB2m95KIkSc2FZEkAQhTPFTOEl6wQ8GA5y9P+BNv0
         rx+l6dI7NB5rRNCBMGAgUl337vc+z/fC0lRre0xnnz+BN66482vjH+rEzoI4PF/mHwa7
         Isqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766656433; x=1767261233;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zPoJzn5MnVIeCWCGvk2Bfp5U8ncISIr0hUiVXJGS/dE=;
        b=ANgeTY1jOcI8tqsOO/oquGCRbVTTEd8KFYxkc+uNXWVoztjcIrK8u9u9eZ9qZNa+Na
         Qbh/igDCns6RudDwECWp7IuO7XWOdNsHJvNVLa0/8xBMUfgVd4c4VaLEUrDinXCdl/2A
         eZC5veDd+2p4asaXtOBtcYGo4tAPz/kDD9xLjskhZWlbV52D4QAGAYm4v9SKqUq5qzvK
         gX+D8nzAgDOWrM+wqrwFFlCo7L4dwE7Ny/BNU51M7rbRIAG2V0o3hh6p4q7TJnCu/9+3
         WPsvNuv9FtgxlCoUkZR5UBvOFH2nejBaXZoKHEUayzeePTEUBoiC6dZA0djcw7Xc4KO1
         PJVQ==
X-Forwarded-Encrypted: i=1; AJvYcCVWZHEDl+7rWr6d5V2RxYaYHL3ECTZ1a9gWmb14PqBLMUwinb5K9iOkn5LbjNSZNo7pzMlayyQ=@lists.infradead.org
X-Gm-Message-State: AOJu0Yxi28ZBc/fe3YnzhyPGW7hRtMZjLKy4GKOl+pNya07Uf9DaZCTC
	9t1F68Cy1q0qsQCEAsVyCduOOfXUGcxTIQiwExPmOdE6dIjyW4GtYpHeX1Sd1dE7Oz2UqJSioE8
	WaHFJJnf4o7LvTlzy9YYXUBgUm65Ayx6rkhYAB5qxmOZltmEoICgnUK0Tm4Zl0LNLO3QP2p0gsr
	A=
X-Gm-Gg: AY/fxX67S57aJlevLb9pnSLMn1w0E4vnHdmH+gUjl9sE7+s5+UPmZF98n4g3K5NifIA
	Tsj/TMf/Sf+8js5cWo40xIweFGkOamM1Q+EikUzYoctkk1RZSaXcHli9Gbd8zvXY3ZAk27vzoYq
	KPmmlnq4f3x7Ih8So62F4Qg1wYSNyj7QqonaBehJJ/+sGRIRyO7M5tIPhiC4mCo4FOyxRBumEQX
	ogSnvZegSUOlnb4mDqfK+9fnwU6g0Tj9Jbaz7YGrqNO7f1rVsM+4dCL44UVR09Ld0/yVZx0C6H5
	RZKGyfMEuQu240+TtqqcoEQGo1Y3haoBVrMtkGZHg65FGrTeGXTeo2EC7BtGNRHMY+RekQm7ko2
	t7WmE2vLHRlEapfBRL6FApSTs1Ht+q1pExSYnIHQ0duxUC+5cipktPHw5OM+UuReHC3iqXAqgy2
	ojV35Rbw==
X-Received: by 2002:a05:6a00:328a:b0:7f7:27dd:7b1c with SMTP id d2e1a72fcca58-7ff657a3052mr16843310b3a.15.1766656432914;
        Thu, 25 Dec 2025 01:53:52 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGn1qJlipakub6W2N58VGWbfUbPN3Zr60Q60P+PGYZNJMcFTv/ySGDvrx6wsHfo/9FhATfXyw==
X-Received: by 2002:a05:6a00:328a:b0:7f7:27dd:7b1c with SMTP id d2e1a72fcca58-7ff657a3052mr16843294b3a.15.1766656432497;
        Thu, 25 Dec 2025 01:53:52 -0800 (PST)
Received: from [10.133.33.27] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7e792b65sm19218679b3a.58.2025.12.25.01.53.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Dec 2025 01:53:52 -0800 (PST)
Message-ID: <566f4d26-8a36-415b-9ec7-3dc5082acb2b@oss.qualcomm.com>
Date: Thu, 25 Dec 2025 17:53:46 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] wifi: ath11k: move .max_tx_ring to struct
 ath11k_hw_hal_params
To: "Alex G." <mr.nuke.me@gmail.com>, ath11k@lists.infradead.org,
        Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251216043555.628296-1-mr.nuke.me@gmail.com>
 <83c5bb41-ac0f-4f01-be38-ba536dc8b977@oss.qualcomm.com>
 <3484871.yKVeVyVuyW@nukework.gtech>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <3484871.yKVeVyVuyW@nukework.gtech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: P9XGa5QSDwaz68ODKqFl6kZ2_2TRWpw2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI1MDA5MyBTYWx0ZWRfXyPpBo/JjHVy9
 6moW5lQk1b+qfSA+0jhKgf4bf9Go9EiShQk1mb80TjGHf/KUtre2Gi6fVQ1sSn7sggw2U1ssa7F
 zmA+R1BnsqrKtlL9Eqboc+C2EParxPwk/wxTeCHY2Uk1vVPffqdYtl4B8Dnp5AT1/aPaWztPR/+
 8OcoOg1D0mI73LwomWkQSg7m+cGq0e/4wxDqJfRpeoa5zPhbj4vn0KvRXk6shODdL8XP2a0bHRA
 kFH3uWKgdTsLwZkKk+6KRgFyJs9duSdGN1h+P84QtT8MCZsfykgvykQkIvOqKv/rzGiJk4ohYha
 NB+PmyQQ8k0a6JsbDVUhv5afTUKJMEYyWfn1ZQlMdnl6gI+CU5yp2Jkkdl98PZaJGRjXdH1OO+5
 +cip+A8xyckK69xvtTkfJpsQOJ5onCCFfddcfJ7JtFC7MEe0fxFmEWBfli6Awp4g1EE7Qu817rT
 21LksPEhSKgyxWDpKSA==
X-Proofpoint-ORIG-GUID: P9XGa5QSDwaz68ODKqFl6kZ2_2TRWpw2
X-Authority-Analysis: v=2.4 cv=M4xA6iws c=1 sm=1 tr=0 ts=694d09b1 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z-jVJAX58Zs0z9JWT1YA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-24_04,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 malwarescore=0 adultscore=0 suspectscore=0
 impostorscore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512250093
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251225_015355_309446_8B69919D 
X-CRM114-Status: GOOD (  10.69  )
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



On 12/25/2025 5:53 AM, Alex G. wrote:

> 
> Sure, I will do it this way.
> 
> I am ready to submit the IPQ9574 support, and this patch is a dependency. 
> Should I include v3 of this patch in the IPQ9574 series, or submit v3 
> independently?
> 
> Alex
> 

I would suggest a v3 for track purpose. Another reason is that this patch is more of an
optimization benefiting all chips, rather than being specific to your new chip.


