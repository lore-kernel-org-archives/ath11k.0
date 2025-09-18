Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7319DCAC597
	for <ath11k@archiver.kernel.org>; Thu, 18 Sep 2025 19:35:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lXAg7ojCyxBCDClCOw8hFL48+P4B5I4oGQpykRIfRcs=; b=DB6FS1ivweSwhSq6ByBHV0FeFg
	xoRBtlvOiONgb9hHGSDHS+xMHNLC856363tsYaYi0Erz7QpW7Mj+z0XrXctUq/tsJPKKykqUJXMOV
	bm2e52UdKoVtISfWtXWAbZPBLWYzoRh2AYVQrkvbM+PEmRdlxXqZtHu9rPTB4IZv4zH1jS53PnmUm
	uvnDlfbk6uswqM4m9nkV4a0xykHLC4fmxkjFThAoGTWKjyUpkdGGTcsy45SMjmlBaLH0UcqKUUunz
	rohclW3DQYhHbjFHYWp+RlUo60X9sBKT3D+hF7Bv3qyWWrO3mjRsIPEwkBHxP1tjKgYSdQ7p4sdlD
	YF+Q3a4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzKPT-000000010HM-2lju;
	Thu, 18 Sep 2025 19:35:15 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzKPR-000000010Gm-0l52
	for ath11k@lists.infradead.org;
	Thu, 18 Sep 2025 19:35:14 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58IEaxhl012312
	for <ath11k@lists.infradead.org>; Thu, 18 Sep 2025 19:35:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lXAg7ojCyxBCDClCOw8hFL48+P4B5I4oGQpykRIfRcs=; b=Xtkp4UxpjlRktOka
	jqZWRYl6lSN6eBIMOk4s/wbGhSvw2lIWoj6cu6WlGj6xj3iGFo2eB3QqIeTDMT/0
	uraaCxyVsyAAgfijWWXphxW2hlWGDySWfEhFPiGXgho/D2NZIa1nF+FB6h0q+3Up
	G2W4FhUNU8oPycgRTNshqheGYYz4phi5FHc8Qv9Wph5QRvqH71EGyUlbE/Q5vQvT
	4I8kk0U05HFSM6tVz0KFXgOnzAeKryj3v6pUTUkjzc3p0bgxMN9259j0QXxW92m3
	+sDsp4FptxgRepegnCZPjdn4a2oRtDiQWkmhE4G8a6/k71rAysZOCuKBghjDkR1l
	jGREzA==
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com [209.85.210.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4985wx3ssb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Thu, 18 Sep 2025 19:35:11 +0000 (GMT)
Received: by mail-ot1-f70.google.com with SMTP id 46e09a7af769-764acfa35c5so1390039a34.0
        for <ath11k@lists.infradead.org>; Thu, 18 Sep 2025 12:35:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758224111; x=1758828911;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lXAg7ojCyxBCDClCOw8hFL48+P4B5I4oGQpykRIfRcs=;
        b=Yjw5abiAT1Yo9QdOeE8GJEglBtFeH5miZq5jvG0nBAAOe5BOAijt32aHUP5xMUtkEA
         naNCCaQ71UfdhX3+aaVs4G8hPPBBTjxQZhz3Qn2biTijCzyPGqUEPEbXSNKtUPv3jacd
         s4psUQL7s0HanW/oq7p/vqvypTpgOytIFpD0xIjNIOjYWzms7xSkAEQp4kSXvCGDQ7WD
         WbtHu2vWJCjg5Tbl2uoPBVfwJTBAISMEN23CwoLfC9+YwG/lnlRUke9BO7XWjtOok35D
         W4gluXjkzetKHA8oGA6kv1qeIfSwyTG7dZp6TJ20wyfocTXIxjd2tUt95C6AlD7QoQIG
         gunw==
X-Forwarded-Encrypted: i=1; AJvYcCUJODYz6iUjR8EzhPa1QVIydG1Pu1xUVGLcXe38Tf94svZE4xPmMGxFnAWU2dKhwXgtK7yE/hs=@lists.infradead.org
X-Gm-Message-State: AOJu0YzSjuk/jOAhomOokNl1czmOkqzlmr4J01G3Z/h92FvMo7YY8H0c
	1N82REWPcOhVYkQSRnfYNePAnfQuJGCoP6VJPwY51VZEsBsg+TvOEIuxO20PYbiOvPCiuKXv7lI
	g5ekeob8kzCe/m9N715kwjUhgXgLwV/0PDUPssboMuGMWdWwgZj+z9mIz5cuMF0sW
X-Gm-Gg: ASbGncvWZmaZJ1ndouYnMuFIaT2KXuCqyp+D3uz5ycgee73ZTh7/EAxnRiEzFU3FZZs
	Owe0cHQwkXb4C4qeaEr+0bkZTfiWZu8hAS55yfyAgFIKKfo+NI4VnMNHeHChpSZsHCy3J/cKN2I
	6PNldYRi0dJDlxgMhyO7E2m7fEwi+wwRfAXUa8umDhbRF5JccQn8FaSg28Il9Pskc82i2JsqEZC
	sPGPc3kqMnFy4ZEOFES/u1rqfKFUgNYg3bC/J15QCv6fRK8lS5o0AvbN5l7r0a6l3vGvl9BlmIL
	bfa95nBbZ/4tNEI8G95leFvzhNJUKP+uuuBtG2Fi6C+0OHz9N+bn9QLqY3JbyzNz7HXR0P4TPOC
	O3AVrpG1VN8zmpWtCzH5LS8AZMvPfLmCZMsGq
X-Received: by 2002:a05:6830:6619:b0:758:4f2f:239c with SMTP id 46e09a7af769-76f7a3a1a45mr571455a34.30.1758224110957;
        Thu, 18 Sep 2025 12:35:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHwoxCYY5Mc8kGGNdF5NWEJW8KsmKqjizen55hJBywYZk1+LhtDIBl6+ggbcPD21Fo/hCQlzA==
X-Received: by 2002:a05:6830:6619:b0:758:4f2f:239c with SMTP id 46e09a7af769-76f7a3a1a45mr571435a34.30.1758224110392;
        Thu, 18 Sep 2025 12:35:10 -0700 (PDT)
Received: from [192.168.1.111] (c-73-202-227-126.hsd1.ca.comcast.net. [73.202.227.126])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-625db7d1200sm1008387eaf.21.2025.09.18.12.35.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Sep 2025 12:35:10 -0700 (PDT)
Message-ID: <1e3e936e-595b-40d6-8404-aaeffdeb3df8@oss.qualcomm.com>
Date: Thu, 18 Sep 2025 12:35:08 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath11k: fix NULL derefence in ath11k_qmi_m3_load()
To: Matvey Kovalev <matvey.kovalev@ispras.ru>,
        Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        linux-kernel@vger.kernel.org, lvc-project@linuxtesting.org,
        stable@vger.kernel.org
References: <20250917192020.1340-1-matvey.kovalev@ispras.ru>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20250917192020.1340-1-matvey.kovalev@ispras.ru>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: AEf21t0U4eL3cWhUkSRJ8JwDWmn4fd8G
X-Proofpoint-GUID: AEf21t0U4eL3cWhUkSRJ8JwDWmn4fd8G
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE3MDIxOSBTYWx0ZWRfX6u86TrLjWE6i
 V2sCrdjDLlKsAgMtvzZb0HQ2vCrEjN4uNO0gXyikYIag2UhSxSYhbmDUAaYjuCjSPeJP56QSRrK
 1luZG6A+hBoNtFsh+KYJK/z1Ua0tl0aArw+NktyS5SxaVEVLtXSZ0WsuA0U4aER5rKycP4jJCbL
 Er8UqZuOLljsPk4tsswxKD1aW5dzgygsdraySW3H8xaGz/oSaSxzJQUgqdQM7ZabiwdSeLQnBf2
 0LcLjtU4tr54yoIftVDgWFiPQ92Cv7CTbvc6r4wH9qng+cN53twaa5EOQibEdDG+JmTV9N25JGk
 3Fr/PgwC3+MXqqROwHdCX4FZpj2SeY1gUuLmGFGEzKHl9CbXRLy2Kf6uv6fgFyrHgvehMiIDXhj
 wqPX0j8b
X-Authority-Analysis: v=2.4 cv=Fq8F/3rq c=1 sm=1 tr=0 ts=68cc5eef cx=c_pps
 a=7uPEO8VhqeOX8vTJ3z8K6Q==:117 a=e70TP3dOR9hTogukJ0528Q==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=HH5vDtPzAAAA:8 a=VwQbUJbxAAAA:8
 a=xjQjg--fAAAA:8 a=KkCtspFpTa3j_I0B6KMA:9 a=QEXdDO2ut3YA:10
 a=EXS-LbY8YePsIyqnH6vw:22 a=QM_-zKB-Ew0MsOlNKMB5:22 a=L4vkcYpMSA5nFlNZ2tk3:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-18_02,2025-09-18_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 impostorscore=0 phishscore=0 priorityscore=1501
 bulkscore=0 spamscore=0 suspectscore=0 adultscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509170219
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250918_123513_340932_525825E2 
X-CRM114-Status: GOOD (  19.17  )
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

On 9/17/2025 12:20 PM, Matvey Kovalev wrote:
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

I'll fix this subject misspelling:
WARNING:TYPO_SPELLING: 'derefence' may be misspelled - perhaps 'dereference'?

/jeff

