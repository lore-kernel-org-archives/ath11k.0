Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 491E5606A323
	for <ath11k@archiver.kernel.org>; Mon,  9 Nov 2026 02:03:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Z/tNHWp8;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PUYUEDMQ;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=g5boPZxe
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=eKJNiJGcbpr8z6s4EliWO1wvSZdyW+jyuqQmPlvgA6Y=; b=Z/tNHWp871oMXF
	hoGHy/jZUr985dDkMK8x9/xjpZJ7V4FSIbwVygWRDlUOq7tk5TQzUq0DLZE3B8H7DaJpR6p01BHxk
	rJZUWyj602trndLeaXNtRLb4Gd7qkctkrEeiW0oF5BdKI+Yo5gADaNUJwN9/zBfchKzi6uA3mfuY7
	7KiItuoijsIglP5MRUN6hxY5MDHv7MH2kMRDOYaEG7W/5kS+DX8sc/3Ro2ySlpYTQZyPoN/sYjre7
	8EfJKv0tXMyIzGLBhU/jK15gu/FbR/oivTbHh+qo0677bECroXuHgW3JhgCyMDdYsE9t6llad9Ub6
	XMZ1A0HYhvH3bhmpzbzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQEin-0000000H5vE-2JrB;
	Mon, 09 Nov 2026 02:02:57 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQEij-0000000H5uL-44u9
	for ath11k@lists.infradead.org;
	Mon, 09 Nov 2026 02:02:57 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A90H5a21795935
	for <ath11k@lists.infradead.org>; Mon, 9 Nov 2026 02:02:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eKJNiJGcbpr8z6s4EliWO1wvSZdyW+jyuqQmPlvgA6Y=; b=PUYUEDMQqJeTQQse
	vhjkZkDVCHXfmDIDjn+etojLsomIMcUgP5qIr2wdExDl+coNYT0gle9FvsQuIj68
	a/g7b4qBHF9gmVHmFo5jpL5pmd8Gy72X8/sgs6GM84SDc7/Eh6hB3sgfKg3D6xXJ
	eHYed1pCPuQzUgICJiO9f4HKTodcWPH2Stg6daOYahYLJYKnPG69hWP/Fxs1cbTh
	sKa3+XpFHVIDVNCIsYOaHXQ2KopdH7kQLYpcjmrT2SgfkzRppyhLFEn/smbH0xXe
	7yujuGOZvszBjJ9nCZ0mX983a9iRoheTjSVMNUiPRvVEh8M1su8g5Vp6Jy/UgVgI
	PqNVtw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hsvc6m7a5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Mon, 09 Nov 2026 02:02:52 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2eaae62796dso4021605ad.0
        for <ath11k@lists.infradead.org>; Sun, 08 Nov 2026 18:02:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794189772; x=1794794572; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=eKJNiJGcbpr8z6s4EliWO1wvSZdyW+jyuqQmPlvgA6Y=;
        b=g5boPZxeZHbYDwOvkcqoI70iWLuNJ8yVOWyHkq52eMFXJMluu4lalBXnCB8hMYd07Y
         kQgntX+elqg8Armg/gQhGGLREgwfF4xHH++jFsVt27K7SIT7YaG4IeCH2n5Y7PaWblAS
         s4ubQBXyqiJsvDVlN7TA/vsami36idO3nmuxc/qS9QCkEHvMCYFl8lKx3JvpBA49xsRx
         1wzN5nNozVoreV6fEpjj5JbBrolVXkniaukzd4QAVmj5DmguJsbSaIa910quLZiUiNdH
         sN1vAEJSjXRBVR3AyQCJF0MivFkBBneo22uP3sIkV52vLQumC+On9XF6DO+EWGfl+ryg
         2GdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794189772; x=1794794572;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eKJNiJGcbpr8z6s4EliWO1wvSZdyW+jyuqQmPlvgA6Y=;
        b=ubVYan8bx2IWk00FNFystQFOllMrRscxRrClk4FR6/JbCCERihlwruznEwuRPwB9jM
         9ggghk+RmivO0SmaHedG40i3Ny2a6zHgcIqTphIYnx1lQw7Q/pHT8RuPzIuqf8dvxqFW
         y6kHoWrXOPDvm+rQx+BFNSeWjR8hLgdRsXWMFGTQPcRJEb68GX/mx9sV+4Uv3Bxyg6sw
         QZ9yPt1xEPgMfOkQ86ZnbA546Y4UPOwzQmj+rdI5LjOvEVB+mkZCmfHeFe9b3tqWIrt5
         D8eDt9Z5lkjdneWEwU/9fwdiSDMAnKVfW6jySUQfkeY9mtTQjDYutRu2lZDC5wHvGmn6
         8svw==
X-Forwarded-Encrypted: i=1; AL+hErFbMMmm1gCk3seW+60KMGLABURwrIMKlHztFAptdA/j2Z/zqLT3z2B2bYNlqZUPy9jtY6J7qU0=@lists.infradead.org
X-Gm-Message-State: APuU4Z9AqL6mpCkKl2WPosq5oSPCKkHgHoB40zsW+mB39OqIMvYZmJMI
	M0rzhPzeI3BVrMn4atc+Ja2vd7O0ql+0vYifmFaLZBjMcv/LL9y43ejH/OY46Lp4uWHycSWskjw
	lNyrTkEKwBt1hwoJYFi4m0szlWCkqnIg2IE6r8cyhwMRAAWCe5oXKWLSKSMiosLdiLdBi1/CQM9
	k=
X-Gm-Gg: AYBFou3QxL/mSEcAwxSBeqMFdUBE/pqyDwN6N/UMNb3AvmRog/SZC9D1aCinkR4y52U
	on20FhQMA0BFL3bS7Hx1jnd0Uzhb+hPkDk5qbxIW5dgc1jJ+CYq7tzR408Sq5MxzU6fKFdm3C+4
	dm17ofrOEsY2+ceGeJnP63KHIiKhFKLQn3uRgDwvxR1JClfjgUPtXsLUdLyNIJOUfFoeeaDlr2B
	/p21j9rcy+HkXSt1Ui3+8wihbVTRabwJn1aRwasrRlls9YAaPM29CclCa3Z0X02lPImldBL0OP4
	JkZQ3SLu/8zW/fEfZjJhxa3FenIa+OkDemcNU4/B193E462rZrJvGiTX5ntDFAIzdwaQuM09+/1
	G8Eap8ZpgBoRcCd8JtNAmg8QsSWx3Bf8Y/JjiFjlG3QgWaS3crK4l6XiPri1iao7Tu2Nys35zPl
	VbOVM=
X-Received: by 2002:a17:903:1b50:b0:2ed:21fb:e762 with SMTP id d9443c01a7336-2ed8373e282mr24624595ad.12.1794189771883;
        Sun, 08 Nov 2026 18:02:51 -0800 (PST)
X-Received: by 2002:a17:903:1b50:b0:2ed:21fb:e762 with SMTP id d9443c01a7336-2ed8373e282mr24624375ad.12.1794189771332;
        Sun, 08 Nov 2026 18:02:51 -0800 (PST)
Received: from [10.239.104.253] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ed815e60b3sm6599565ad.26.2026.11.08.18.02.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 08 Nov 2026 18:02:50 -0800 (PST)
Message-ID: <6f76f35b-0ef7-468a-934f-1c6426ca9760@oss.qualcomm.com>
Date: Mon, 9 Nov 2026 10:02:46 +0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath11k: Fix potential SRNG configuration leak on
 init failure
To: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>,
        Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20261104-db9e3c75b3-wifi-ath11k-1@mail.sdu.edu.cn>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261104-db9e3c75b3-wifi-ath11k-1@mail.sdu.edu.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDAwNyBTYWx0ZWRfX128Xr7vHG8DA
 f8xul3DTmp623C0ShJ6cYBolyDYhu9LLicUVdY6+8XYWMVsbxqZHceE4+VQCFc5G89ODACa46T1
 dlQV4xUrcP0x3vzjLWvxUFAw1uhfi6t1xU6v7RiVDv4IW/QthWNC/2GH8Y8UTqrbQBgH4/NXGt8
 HowfNNpJT1FvAcEm4xgUmMCvmz5Wu2gWa6eVMQ4YqIFus3YlUEf3ZudOTnJe0xUAQdP+pYTwJOu
 axF5Dy5jeayq5Cmnwa+NyaaONRZrYI7Z2cyIjjPKGYvIUmARlYXd7Bko9OIEou/mb2RJPw4WrSB
 EK5sphMZbGJmj2kM/zlQmTQScahVHAZxrHOehF7ESsxidlDAQYTxtn8THriWnnTAA77kq0/pXNt
 rXd5eYrwSwGl4oSznVoKpvVHRPsxpvxAKSgCHiuXeaEt7lJWdPHdwo2phsR+dWcUOeoMIhMrgq9
 219REUqxtx4CajAhAbQ==
X-Authority-Analysis: v=2.4 cv=WOjqzXsR c=1 sm=1 tr=0 ts=6af129cc cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=Rv8SPUj7cjXdj5bJQ3UA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDAwNyBTYWx0ZWRfX7Mp6jBECE09n
 TJsX+Myd2hAck2IOMSrpYi9vA3YUx35lwfSw7+RMbqLKwoc2Y1hoquhC5V507NaJQ29gukU7207
 VLnAsUM1IokA/5Vv3dwpcawgfCGWgYg=
X-Proofpoint-ORIG-GUID: fK--4oEjqyflAKoLV2GAQh0LnZVTNuQm
X-Proofpoint-GUID: fK--4oEjqyflAKoLV2GAQh0LnZVTNuQm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_01,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 phishscore=0 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 bulkscore=0 spamscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090007
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261108_180254_134684_9D41D82C 
X-CRM114-Status: GOOD (  16.51  )
X-Spam-Score: -2.8 (--)
X-BeenThere: ath11k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath11k.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 11/4/2026 10:33 AM, Guangshuo Li wrote:
> If either DMA pointer-buffer allocation fails after the SRNG
> configuration is copied, HAL initialization returns without freeing
> the copy. Its callers skip HAL deinitialization on this error.
> 
> Free the configuration on both allocation failure paths and clear
> its pointer before returning.
> 
> This issue was found by our static analysis tool under development.
> 
> Fixes: f7eb4b04ce6f ("ath11k: hal: create hw_srng_config dynamically")
> Signed-off-by: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>
> ---
> Validation: x86-64 Clang W=1 changed-object builds passed with
> allmodconfig and allyesconfig. No hardware/kernel runtime test or full
> linked-kernel build.
> OpenAI Codex assisted with source review, patch implementation and
> commit-message drafting. The submitter has reviewed the changes.
> 
>  drivers/net/wireless/ath/ath11k/hal.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath11k/hal.c b/drivers/net/wireless/ath/ath11k/hal.c
> index 98bd9e3f0aae..8a4e5042d89a 100644
> --- a/drivers/net/wireless/ath/ath11k/hal.c
> +++ b/drivers/net/wireless/ath/ath11k/hal.c
> @@ -1351,7 +1351,7 @@ int ath11k_hal_srng_init(struct ath11k_base *ab)
>  
>  	ret = ath11k_hal_alloc_cont_rdp(ab);
>  	if (ret)
> -		goto err_hal;
> +		goto err_free_config;
>  
>  	ret = ath11k_hal_alloc_cont_wrp(ab);
>  	if (ret)
> @@ -1363,7 +1363,9 @@ int ath11k_hal_srng_init(struct ath11k_base *ab)
>  
>  err_free_cont_rdp:
>  	ath11k_hal_free_cont_rdp(ab);
> -
> +err_free_config:
> +	kfree(hal->srng_config);
> +	hal->srng_config = NULL;
>  err_hal:
>  	return ret;
>  }
> 
> base-commit: 05441d697f7f9a927264f4058cbbc6a03dfcac9d
> 

Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>

