Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8822CAC597
	for <ath11k@archiver.kernel.org>; Thu, 18 Sep 2025 07:05:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0Y9SMRbrA8EfTA12V370ZjzmDEQEjVLQldlUuJJBEUk=; b=13UQ15RCoPGdJV+C4nQYCdiezC
	DuHVqCDoRIqN3ZhfNiJ1iueprLTtl5+jsLohgGh5Xv6tdwLljx5qavpCzRzf9Vp9+Fvw+O3SeOdCX
	jAmXnbHJGWWhu++A5U8YetaO9PFXb3nczDLIMRgBslkwrydIe8CTXYVYrSNF+5N8vPz5fyWCY6QVf
	7SULEpjbQ1f8sbiNimXjMneBkt9OdsOeRhT/6P+OQOsGPZalZpdFv//XoTQnM26EJqLO7ZxN/qSM7
	kTK4C6zdGlB/kVOAXlE+K5f+2WvWupWwNbsgbtBWPwW+gkg0IhmR/pP3sqPStyosZ7FmrLnjzeBQZ
	7IZ5EIQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uz8iL-0000000GVD8-0QlL;
	Thu, 18 Sep 2025 07:05:57 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uz8iH-0000000GVCk-3sPg
	for ath11k@lists.infradead.org;
	Thu, 18 Sep 2025 07:05:55 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58I3QmhL014213
	for <ath11k@lists.infradead.org>; Thu, 18 Sep 2025 07:05:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0Y9SMRbrA8EfTA12V370ZjzmDEQEjVLQldlUuJJBEUk=; b=CzwXGlfPIZZ8Rm9v
	ih1v27tHolXYHI+S6bcDnGZrFBIabu+6GzYStzGhtFffoTTYVJMiWSc1x5PhnGlI
	V+mwX8F/oRysHinaf6sY+esqb1XW+lHqRDchiaJtubCm1Xx3EL1uQpYnGzxNWlov
	YiQu3tzSPJ6HobXwzYay6FxJ99/8/6fOGHMOrvisvDpAysCPO/rU8rhSzuIVLWaK
	4nV73y7n7A2dlaL5Uutsvqh+PFU/tGVYv0ikHAOC5nL+jYyCxE4ZUCGHcNlxe3Xb
	d+ck9o66yUc6kz3McIGX2sY4GYdENz2+dYmD5gLlhk3h8Gx9KbICcxgGcCO8Amt1
	6C3Axg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 497fxu5axr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Thu, 18 Sep 2025 07:05:53 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b54fe1d849aso814201a12.2
        for <ath11k@lists.infradead.org>; Thu, 18 Sep 2025 00:05:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758179152; x=1758783952;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0Y9SMRbrA8EfTA12V370ZjzmDEQEjVLQldlUuJJBEUk=;
        b=R3fwSYp4+Cbr23t/ZvaI2SF87IhqFLJDF4LfLzcssdVwIX/sWSVse3Bk7kjdOjI1kM
         gmvqhbJ0j+nDXjDjx3WsATLYx1oRnHrkap2aUwR29+PExFJ+lCyaX6puEoS/0uiXhg6e
         YJitLQBQuSDays1EUfAVorPV0rLrMnmPqOExdoQd2MYJ77AGjBJlDn5ji/jwN/Gp3HbS
         gIGiH74L5sdI7f1HTYCCzpoPr3Zahqn/+6hJbdA0gk83rULyrV1nVExtt75khmIeZQTm
         vU9Jv9B6LE844fboZqSBui52hofaXuyJMC1GJeN31k09qqa0SQVNIJWbiR47nFAZd30X
         i7Ig==
X-Forwarded-Encrypted: i=1; AJvYcCWpyfGdVWhCFP2VjID9qr6t5/ZtHuBM253sHpP3NhZ4lT+xxkVpndWQ/+iR1ml4/f9+pS2Wz/g=@lists.infradead.org
X-Gm-Message-State: AOJu0YzwL8YYsRQiroiTD9SAwUW5Fi+dQsODZA9Qg29F/9gHI/JTiZAI
	BhLzhzWDO78RXQ1yhli6+6NEEhYm+gIX+00grwjKoOsYEPLpxWjVT2gu7VioGDU1Yc6cvQQDXfF
	yAzO3qtwNsiICmTd0UenzHdmXAjAshoFqSvKpA9Y4MYF06giAH6VgsrlG+/adpEMa
X-Gm-Gg: ASbGncujD7pGD/CRuiDrnqGQglPacAnqG2H43YDely+7eYYS5RzUR4VeP0cYnBe+SCJ
	61sIs2RV0jKzLDzDOy2Y0RS6aKXi+t5oBUVYe/kR4IiazT2OE2fH9e9tJEKKbrJqwIvJf6g2cfz
	8tWxtgBLe3Tk8+1F9dazq6v1t6GSDf+AL3nOQ2bXXw0aVuOXG02g1fGjbOro6ScYrFODBlGq6EW
	rN7i1gwhdGqEJKouLciN6dK6KWfmkHV2Zds7CQG5qwU8gBgx9SaHd4ruX8SyJ67ByQARnuE4bnH
	Ev4HqsLL3/FMhe4o+FXapyt6Kzmd2WOSgqs+p3UN42SYIdb9J0ymMWCX9fdXXvfV8K1nzpRAnr4
	Y73JeJp2m4T1Fvb5fHwtIsgE/Vl3qSTHT7jDZ
X-Received: by 2002:a17:903:41ce:b0:24c:cb60:f6f0 with SMTP id d9443c01a7336-26813ef9e7dmr70240705ad.58.1758179152481;
        Thu, 18 Sep 2025 00:05:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF7dkYXHMRO6tV4bI3uZ2zCxGvRmSsCJrG/bAY29MaksfKUnV6mW/CITxSJyjLu2qyBOVYXhQ==
X-Received: by 2002:a17:903:41ce:b0:24c:cb60:f6f0 with SMTP id d9443c01a7336-26813ef9e7dmr70240425ad.58.1758179152014;
        Thu, 18 Sep 2025 00:05:52 -0700 (PDT)
Received: from [10.133.33.30] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-26989844036sm11100095ad.31.2025.09.18.00.05.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Sep 2025 00:05:51 -0700 (PDT)
Message-ID: <88ce11d8-52c9-4170-84c0-d364367646a9@oss.qualcomm.com>
Date: Thu, 18 Sep 2025 15:05:47 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath11k: fix NULL derefence in ath11k_qmi_m3_load()
To: Matvey Kovalev <matvey.kovalev@ispras.ru>,
        Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        linux-kernel@vger.kernel.org, lvc-project@linuxtesting.org,
        stable@vger.kernel.org
References: <20250917192020.1340-1-matvey.kovalev@ispras.ru>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20250917192020.1340-1-matvey.kovalev@ispras.ru>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE2MDIwMiBTYWx0ZWRfXwItUlnluAMLP
 0l2t83B9e9R0Mchusk+/IrmHYFtkOlqHNA6ewuQMJDjeSRAKO+5vM5gTCzUc7DdzrvHWroxBOvN
 vp1P/yJ9bmDbJ6ZD5jLPCkDsSP8MzkJguhXkza+SVsZqwJFZe2nJ/KMNL8pclgxY3QT6ysqF3GE
 +b12omCN0hilY1VvnlhBZkq3udqPy92NnxdVtl8qyHGz6KnDUctAmeo+frisYnb3eImeMNai882
 fbdGv3Wiz7wEP9chIZz8llvjVskOshn3kd8KZBUIrzvD8PKkCn/Z0cFJAuQnAmSOMpkhvpoanS4
 sjWMINyFnxa0MW5Q/2sLFiOafnpUX2VHN1DBaN3TDvz59lM9TyjqHExgfUzphyMHnWtc+6q/QYp
 AbmM6msP
X-Proofpoint-ORIG-GUID: qvg2LYLC1IHmqLcOkcxpzafeVc1W0Zgo
X-Authority-Analysis: v=2.4 cv=R+UDGcRX c=1 sm=1 tr=0 ts=68cbaf51 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=HH5vDtPzAAAA:8 a=VwQbUJbxAAAA:8
 a=xjQjg--fAAAA:8 a=EUspDBNiAAAA:8 a=CFS23snBG6XJB5ISPFYA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22 a=QM_-zKB-Ew0MsOlNKMB5:22 a=L4vkcYpMSA5nFlNZ2tk3:22
X-Proofpoint-GUID: qvg2LYLC1IHmqLcOkcxpzafeVc1W0Zgo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-17_01,2025-09-18_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 adultscore=0 clxscore=1015 priorityscore=1501
 bulkscore=0 malwarescore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509160202
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250918_000553_976051_828E4735 
X-CRM114-Status: GOOD (  18.12  )
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



On 9/18/2025 3:20 AM, Matvey Kovalev wrote:
> If ab->fw.m3_data points to data, then fw pointer remains null.
> Further, if m3_mem is not allocated, then fw is dereferenced to be
> passed to ath11k_err function.
> 
> Replace fw->size by m3_len.
> 
> Found by Linux Verification Center (linuxtesting.org) with SVACE.
> 
> Fixes: 7db88b962f06 ("wifi: ath11k: add firmware-2.bin support")
> Cc: stable@vger.kernel.org
> Signed-off-by: Matvey Kovalev <matvey.kovalev@ispras.ru>
> ---
>  drivers/net/wireless/ath/ath11k/qmi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/net/wireless/ath/ath11k/qmi.c b/drivers/net/wireless/ath/ath11k/qmi.c
> index 378ac96b861b7..1a42b4abe7168 100644
> --- a/drivers/net/wireless/ath/ath11k/qmi.c
> +++ b/drivers/net/wireless/ath/ath11k/qmi.c
> @@ -2557,7 +2557,7 @@ static int ath11k_qmi_m3_load(struct ath11k_base *ab)
>  					   GFP_KERNEL);
>  	if (!m3_mem->vaddr) {
>  		ath11k_err(ab, "failed to allocate memory for M3 with size %zu\n",
> -			   fw->size);
> +			   m3_len);
>  		ret = -ENOMEM;
>  		goto out;
>  	}

Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>

