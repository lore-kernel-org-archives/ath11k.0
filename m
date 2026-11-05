Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B22C606A332
	for <ath11k@archiver.kernel.org>; Thu,  5 Nov 2026 17:36:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=b2b8W3BV;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UzPQOUZP;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BUHlPd3r
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=APYTMa5wqJKDsloYf8WsHxudYGdEST/0iGIISjyttOo=; b=b2b8W3BVTB1Chk
	2BZ9yaV3uIGInY2nCajC0VtuWAyd55UJwpRk2ZGJNAq42ygV+1JWUoniqThx9St8mhk2TxtSkEK+7
	ee8c20HxLoXHePyrczgFoq/8yw+dWZEUwz6slx6VkFCF9J9aKhChQ6MPgQFL980gtyeXfBCw3O+eG
	6OliOICDiERPQokrAADOFZOQFuEIT9zl41TWYbQA+rtEjGvuAG4AvE0PPnu2mrneuBE7TimA8YKVx
	3fX1sYEt3G80U2ZnZetGYmJ9lOtlsSFbRM/CqV+D1JPrzJBZss83top2GxIS9Q4dMwy684ISDyYF5
	ew/qfW04yjyS90DfNxAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP1OL-00000009xhL-2nI3;
	Thu, 05 Nov 2026 17:36:49 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP1OH-00000009xgE-29lQ
	for ath11k@lists.infradead.org;
	Thu, 05 Nov 2026 17:36:47 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A5EQI9h1631042
	for <ath11k@lists.infradead.org>; Thu, 5 Nov 2026 17:36:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	APYTMa5wqJKDsloYf8WsHxudYGdEST/0iGIISjyttOo=; b=UzPQOUZPwBpiyKHo
	t82syey/EgfxUzie7LDcWi15iHRW/ub2HFhNxz2RjPuqLVcVapvM28nu19iW9Adi
	0f5l6+OQ+2PhupRbUxxqzHl94xVTEfE2qKbtWsMcSmWTYbBbCt3eIYgXU0h4clw9
	QD2De06sEP+0DxNPk2UYHdp1rJ9JXPXcRuq/ms3FQFNdf07MHhHzj2hstZdidsaf
	CkkTUUaA4nGz/R4cljmCGX4FZhiIMGhI0aS43/zNcfX9JpasYmB4FRad0s9BdT17
	80Yjtmfudz9oEG9k47CWX13jnhdWrlRBSZ1V7i9ZnsOUDJw3E2z/1h3F9weAg5Ed
	d5tjbg==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hrkaqb4gj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Thu, 05 Nov 2026 17:36:44 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-139b62317d0so4751979c88.0
        for <ath11k@lists.infradead.org>; Thu, 05 Nov 2026 09:36:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793900203; x=1794505003; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=APYTMa5wqJKDsloYf8WsHxudYGdEST/0iGIISjyttOo=;
        b=BUHlPd3rlXQfZ0AZ8a8uqbAJ88KZt7mZjFGl/IjMay0ccUbmBnhIYAbWOKApK8CQMN
         A9P/1RU1lhS1OTrvOsomMR3RFPI0/kE/USHr7FIBZUK6FSEsWOEKCbhDiX1CQaIMzHwu
         rojJiESJJR8juftsEL56Hr2kXkp5gqS28g9JYQRfgT1uepvvAm34Euv4iVKyzU5lh8EC
         XyJ7hOQ59ZgKzasRk1GUVCIXbaMwLOfx5ar37aU+EhcXu29w48REOGdmtLSlv/ga+Qa6
         vAljSReboUOcnoirIy6WxpQgxaw0890ztVru2Wku8g0XfGja8fUHR2CHaFVnWZfjgbL3
         7SwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793900203; x=1794505003;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=APYTMa5wqJKDsloYf8WsHxudYGdEST/0iGIISjyttOo=;
        b=NSw+qI/Z0uM9/Pa0ith7/CyNbyuVkpwy0jTx8ZiMNEh1SxvWHiGjUmU/7S9hhKu8T0
         vMdgdw8iTcqVoNUqwXLoDrH6GdGt6LLdaz6oOl/WLVa28EoEVJfSo3xIY+GiPVYzYLiF
         ZkHWDVPo1afJvP4M37HEisbbeGj6bdFzJtaRK4xPhM+Vhfo7M2nzwMdt6j21HlAzjn+6
         wsA3YkLm44s+z6z/3QVybuQT/mJItstS1RbqE/EWn8SQcMUxje4vsqx51vOpA3+oqc6g
         Jr1igW38K4jGfVee1572WNvfKjxnlQwpu2+R64JmeMJqO72vkKhWNJkuNda/TbJavWCb
         qvSA==
X-Forwarded-Encrypted: i=1; AKwUvBwqOhXmJ4FbDgMwEOO7u0WykrJsRia5edtudEhWrQoc8A/tM1gWlWOMpBhnVo4hzawgWT1wL94=@lists.infradead.org
X-Gm-Message-State: APuU4Z8nzW68RT+f7uKTV2bHOrByeBkOpnR/ViP64dJ3jYV/+ewq63Wt
	h3jDVAlSlavTgG8RUB9PhlQC62pC1/jRCEKQomufI3RKTpDgEOK6/02q5UINcRJjkSsVTeSuiKb
	wAePCJnuL/jiS0f8aKv4VINClMc7wZFNT5dlOshV96qljqLo2o8hHuLhgF8ijfiwU
X-Gm-Gg: AYBFou0O/g1xJkRJeazHdLp1/mthiy1Zvq5ig9kVkRNoOVvD3lYdv2BYqDPqtJmb5CQ
	aJuDntwaag1tWk9SGL49Pm3iaHbuc+Q06Qt98QLryrN6tJfcn+XLufSYGo5ChOMRpkdcGXYGvfL
	yvw5Tlr6bnlagfmhSgAIitB/mm9m6DX/waKSBWDptHKLZRVrlkjxyCwg/+vUpI3i1wLQWbWCUEJ
	qb6kLAQcu7jUrBL+IaaEpUbVX/1kZo9hH6eibkhMnxEcCPOOVIq5uMr+EyshT3IiQ+7gjPZtp6q
	/P44bTHWsFk0bSGwijN3IfDjIz0euIILf9kQH7Edb8asBrOZPN5pSpSCjIZTa9Mc7AXDqgr+0R/
	IHrf+JMmUod+JBO5tsp94nrpMLD+zuGzAwIxsEFGfhNUzKTbbdjVAk0tDanFU7LZaZlRTvstRKr
	EeTq+bwfepNjmYa2U=
X-Received: by 2002:a05:701b:4182:20b0:1a5:52f6:db9a with SMTP id a92af1059eb24-1ac5ca23c29mr31173037c88.22.1793900203231;
        Thu, 05 Nov 2026 09:36:43 -0800 (PST)
X-Received: by 2002:a05:701b:4182:20b0:1a5:52f6:db9a with SMTP id a92af1059eb24-1ac5ca23c29mr31173001c88.22.1793900202497;
        Thu, 05 Nov 2026 09:36:42 -0800 (PST)
Received: from [192.168.11.102] ([124.123.80.135])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245c1c283sm18824490c88.4.2026.11.05.09.36.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 09:36:41 -0800 (PST)
Message-ID: <263ba263-c59e-4d43-a745-cd7faed3c681@oss.qualcomm.com>
Date: Thu, 5 Nov 2026 23:06:37 +0530
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
From: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261104-db9e3c75b3-wifi-ath11k-1@mail.sdu.edu.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: f-OJQKS-yLWYbSj3V5nen-wMIg9r93qb
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA3MCBTYWx0ZWRfX9n6lRlVbp1LE
 c9vo/yify8UyETVeoRe1xtvJF/QqrTSNYc7dcC8EG8fD6IrOctSGZ7BCIU2HzRgx3l/wl/TfEmN
 9yRUukL9c2og78X5J6ps+k3YY5Dw/48=
X-Proofpoint-ORIG-GUID: f-OJQKS-yLWYbSj3V5nen-wMIg9r93qb
X-Authority-Analysis: v=2.4 cv=OZoNnRTY c=1 sm=1 tr=0 ts=6aecbeac cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=kllYWVK2JqQtNyhMtAlpJw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=Rv8SPUj7cjXdj5bJQ3UA:9 a=QEXdDO2ut3YA:10
 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA3MCBTYWx0ZWRfX915bx/V4QDUJ
 ZM75gtkSN/UpYanzQ+XoOxYNvM8+QTT8qyHStNp+LpYP0JZ+kN+THddYo1DrFRO85WjyZe85Gg7
 DPS6SunyBSI1X8aYm1lLGdmj68Q1P+vV8NDLc1j7EDuhSfQPB2ZUAjIGHITH0iA/GfMfno48jHz
 BJFEhZ0saMBT3ijpBvXGFlb2GSzlfZGW//gp8hM01P6hUOY38uLznJLB7T5wpEJJO7/W8La/GRc
 FE3m6RbTJJijvq1sAoYymSKNm5+eJHKudi0ITFFENibL1WCNzW/d4jdT5TU3syQXyp4lxIMMEwg
 S3IFtKmTZZLZfBRpUk4orTCaglAx9MvQjlwV05WGy0a6oTiw6AJHGoEOxwU8p0IpFXO7pQ+F9Sv
 ahnRX1I/6YhuuuHoh2i24rQwBZW1D4LGAgtbzDmXujbYTMSGVDPUrPyLJ5Xs5dtTZeLpXJACeS+
 qNWXWUBHQxbzxIyDEfQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_04,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 bulkscore=0 clxscore=1015 malwarescore=0
 suspectscore=0 lowpriorityscore=0 impostorscore=0 priorityscore=1501
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611050070
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_093645_685273_D5E6868D 
X-CRM114-Status: GOOD (  16.72  )
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

On 11/4/2026 8:03 AM, Guangshuo Li wrote:
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
>   drivers/net/wireless/ath/ath11k/hal.c | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath11k/hal.c b/drivers/net/wireless/ath/ath11k/hal.c
> index 98bd9e3f0aae..8a4e5042d89a 100644
> --- a/drivers/net/wireless/ath/ath11k/hal.c
> +++ b/drivers/net/wireless/ath/ath11k/hal.c
> @@ -1351,7 +1351,7 @@ int ath11k_hal_srng_init(struct ath11k_base *ab)
>   
>   	ret = ath11k_hal_alloc_cont_rdp(ab);
>   	if (ret)
> -		goto err_hal;
> +		goto err_free_config;
>   
>   	ret = ath11k_hal_alloc_cont_wrp(ab);
>   	if (ret)
> @@ -1363,7 +1363,9 @@ int ath11k_hal_srng_init(struct ath11k_base *ab)
>   
>   err_free_cont_rdp:
>   	ath11k_hal_free_cont_rdp(ab);
> -
> +err_free_config:
> +	kfree(hal->srng_config);
> +	hal->srng_config = NULL;
>   err_hal:
>   	return ret;
>   }
> 
> base-commit: 05441d697f7f9a927264f4058cbbc6a03dfcac9d
> 


Reviewed-by: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>

