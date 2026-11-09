Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ED42606A325
	for <ath11k@archiver.kernel.org>; Mon,  9 Nov 2026 15:00:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ogpJCDln;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NctNdtZc;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PbPjW1lI
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=yk/7s1DGK2LaMZgRPwzZnMgeWvDZ0DPNeBQ+fDXOGmo=; b=ogpJCDlnsEtsc6
	XCG191sqY0Vdljl68dEjomKAd+gbeV6VJRg46Kul4V7ka8VCXOXLDLKXgDwZlvj98u73VdsKEnvaU
	elP02Kv0HDbDK+C71vZZH6xw6lPey+yU+1++O8u7lmOFg/HSAanlBo6uvOHklgRl8lbjMUBeTCKEk
	jBJw2tZ2ZSjTfgBJpGV0aLKiyJrh8gcXZCcKLCom9Yqx6BwN84ANjrcvT26lCRmHvyHZ5AnolJglS
	oaMHb7x/9eqjavcWzNVi875ytOjLMRPVZYMFk5bAzZ1eoGqiQUVLs0sccW8aFkbFsCRib8OgRaYbo
	38oG2xrK4hu2Ru3cxkiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQQrb-000000010ar-05Fn;
	Mon, 09 Nov 2026 15:00:51 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQQrW-000000010aE-31hi
	for ath11k@lists.infradead.org;
	Mon, 09 Nov 2026 15:00:49 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A9DFLc53588649
	for <ath11k@lists.infradead.org>; Mon, 9 Nov 2026 15:00:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yk/7s1DGK2LaMZgRPwzZnMgeWvDZ0DPNeBQ+fDXOGmo=; b=NctNdtZcMYdvTKdT
	/9OUZD/qmpDdrtC/gm7Dhj1O5TpiNZw9NlN9CRpWh3eB7qlyBIIHgLN+sV1rX8zV
	MJzpTe48JkfeUiRyNCyeteqMHnGAAmhCVGAcYKVhen+Of+oCYTinBibwY2M9FPft
	ijncgMxHX//+t5JRbYO0jkXtW0w5IsTGj1KhEDkQyuqaI7dZquDM/lOU1itfcVsw
	T/GB8ImYwPcIAiES1xdoHvcwF3faS24kVpURJinjg2emlZdk91+COykXUDXO7vQk
	r26J9x2Xpz+2YLx+kpeEdVFQy01oaWh95rIFUMdp3VLt8BJaS/mbouLk2o8GnBXT
	B1y2FA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hudcj8pmp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Mon, 09 Nov 2026 15:00:28 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cdaf2073b0cso575318a12.0
        for <ath11k@lists.infradead.org>; Mon, 09 Nov 2026 07:00:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794236428; x=1794841228; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yk/7s1DGK2LaMZgRPwzZnMgeWvDZ0DPNeBQ+fDXOGmo=;
        b=PbPjW1lIE5XiK4dh663Ko6+2BT8YPzlsVXwtMWjkC5AwgG7IAdw6IxZryOP5uXUkFs
         cD7BkQxWLcnt4Pagxa0PzwIyTEhXtNo5T1xXOXQ8K7J3MO50Qj5VO2oKO9vgQkuD9K+W
         wFQqBtd1pWumIByiGKpvn+iqA9EwxEdLw5vybyAY0xxkvxqgPyNHZx/P/P21Q+JwfavJ
         59iR+ORvCw9bOPeY8hhQHPUdh3qzQG47pb4rwyq5dUZ0B8gEqnN6yuaegyUIWcNOa8iI
         p85grTEOYH2YPkWVl9FLiu3v8f1weCe4atTv5EgHoYHgW8NkYzdL3XZ1S4Thocf1crUX
         gN8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794236428; x=1794841228;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yk/7s1DGK2LaMZgRPwzZnMgeWvDZ0DPNeBQ+fDXOGmo=;
        b=NEDmEicPly6ccHXdxFmkUE9QHd2p75r8wJmKZRZq0okZyDx15BdAKV07+XSd3FflNb
         FriOS7NGdl0AqElXrIFP9vRTemdkHTZT47DWqIcS00RFYKAtg1pcyLltf/H21X6kWZSV
         /BXlwJ/7Hzqey3KJCA4myAwaEn63dYihwCjwuPbba6EVfO7oj3Q/wQZ8WH01o/9QLmag
         jnSYbor+CegWqUPYwsjQzwFgP/q1q41GjYNHo4ECZZC9inFNN6qX0DO1UMh7QLlt5Ks6
         iN22YyxOKoRhmygUl/JQhoghAH5kHzWq5kxOBJH6zXcFyRIILkNbL1PgtlcG5FD/hDLz
         J+9w==
X-Forwarded-Encrypted: i=1; AL+hErHgXnFXYJbJFETC4v6D7ik1atrj8W0Tg9ijE9RwMHZZjfM7aY2DkQ8FKyChKRE3rlfOj5OPG70=@lists.infradead.org
X-Gm-Message-State: APuU4Z/z6iZZ0FAuxR9Wem62fSdvUUGvRxBmQGpdTqZem156KVPvR4s7
	HNYMnFn3vkQ3GdY8KZCrJ+rAHy9ZettJ9AmqXGylHkAEMQlpNB+8iq/Kq/+1F7Qqjr+1q/YwQku
	mymusyQl2Yr8utwZ4+2kO5dvGJ3QAtAaEcBtrHJJTOVUoGhfAdceJgeucZjG5Vux3
X-Gm-Gg: AYBFou3Y2ZTllPj0SXy9JJP/xkByEIjh6ZwU97Ad1VpZrrdEgtF0Wvi5rxfL+zKceB0
	fUGrhYe2hF18PXXgQK7dnC7hqk4AZ2F+HCZUd1dP+WabMFBl9LZaA9DoYiWCrZmaDxOEEBplHgt
	Q9AFgVl4gkyimIwcMJjObeWl0+tH5GGueeADyQBt5ZIL66XPv1QD1gXNsJNRy+G7k3aN3LBOg3h
	htp2vROvxo3domGMz0/gtmVUW+RUYviubQQiWvGjOEUq/6MQiZ65fkCayLPcLEBciie7YOloF5F
	cD/hS9YqAgKsPO/VN/R6EPF+YaKxKegiq8OPUCkdNOI+23bxFgO7YscQuLIEi+kkwqO6ItCYQSc
	vHiagGuc+ctEGByzCvejxB+1zziKvaEtiHQ7IYPEpCgXzsX4lnNyfJDBJTGRojYwAsNj0cUtgFA
	oDYmxtisZ7LcgTxkOQvMsdBekNbNDicOU=
X-Received: by 2002:a17:903:19ec:b0:2ed:3f47:9691 with SMTP id d9443c01a7336-2ed8378c6cfmr48201025ad.42.1794236427942;
        Mon, 09 Nov 2026 07:00:27 -0800 (PST)
X-Received: by 2002:a17:903:19ec:b0:2ed:3f47:9691 with SMTP id d9443c01a7336-2ed8378c6cfmr48197085ad.42.1794236424114;
        Mon, 09 Nov 2026 07:00:24 -0800 (PST)
Received: from [10.227.105.111] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ed8173a8b2sm12837335ad.67.2026.11.09.07.00.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 07:00:23 -0800 (PST)
Message-ID: <a39b1918-5d04-452b-8b5a-0703963f4587@oss.qualcomm.com>
Date: Mon, 9 Nov 2026 07:00:21 -0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND] wifi: ath11k: release the rproc reference on
 teardown
To: Wentao Liang <vulab@iscas.ac.cn>, Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org,
        workflows@vger.kernel.org
References: <20261103102915.1341148-1-vulab@iscas.ac.cn>
Content-Language: en-US
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
In-Reply-To: <20261103102915.1341148-1-vulab@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: PiZMs_hoigg1WqHpJwOuGyj1XObfCDy4
X-Proofpoint-ORIG-GUID: PiZMs_hoigg1WqHpJwOuGyj1XObfCDy4
X-Authority-Analysis: v=2.4 cv=au0nmiZV c=1 sm=1 tr=0 ts=6af1e00c cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=mvyCH3EIRwqJGMeifaAA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA1OSBTYWx0ZWRfX4+0a3L7rkVtb
 RvnRZxHCcrSEQXlYBr2EMlGDoYe3RsKD2/dyT/B/xWfSEx+7ZuR56vf1IAf7Sk8he1TDFgVzk1N
 FFaUpUYXcJCY1XRVB9/VWCXLtWms/OQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA1OSBTYWx0ZWRfX5ZIyCPgpCEsN
 nbppvNcboGE4IAF/nkWLLnTc4xrS1rHgo8OdHSqkxRBTgVnHWjHWfzNzo1+6RGNH3Ocnim/zGdU
 Z/wMzfdX6S6LtG9ya/Du7T7Tnjeab7sl7vARwaxHdnUdk+ADZNfL7ses5t1h1FFIWL2bU6zMoxa
 sbjLGPvueWNSh0ZMgjcIiIiBrXxMk8PCFocEqRNidhVXj2hsU7vk75HaKEAk52JVZFu0AJmfOpX
 fJ3NOPIKpcv70TVHEFS2RkyaaShDOVGGvRZ2dMATy0CWBvFCgnmHyhcrAYJXlYMFvZUNmfNpQzr
 ihVF3LWMiaj+ZQ7gSSqLSKKuaF3lVSQucjSlxdtQVsJfA6DadhjvUg+VsHZftmkSDQeYSqR8E/Y
 ZC8a+w+esTo6pn0Gr0tXoDGhmUhvMvQWlVAvE9A7MaAxNLoUQEX3XIEyJKHq6/nrKaM9oNizzOw
 Uwn1FfViLM2D0wEOEDg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_05,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 suspectscore=0 bulkscore=0 impostorscore=0
 phishscore=0 clxscore=1015 malwarescore=0 priorityscore=1501
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611090059
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_070046_796810_D81C0504 
X-CRM114-Status: GOOD (  13.36  )
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
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/3/2026 2:29 AM, Wentao Liang wrote:
> ath11k_core_get_rproc() looks up the target remoteproc with
> rproc_get_by_phandle(), which takes a device reference and a reference on
> the remoteproc driver's module.  The resulting pointer is stored in
> ab_ahb->tgt_rproc and never released: ath11k_ahb_free_resources() only
> tears down the firmware resources, and the probe error paths after the
> lookup jump to err_core_free without dropping the reference either.
> rproc_shutdown() does not release it, it only drops the power reference.
> 
> Release the reference when the AHB resources are freed and on the probe
> error path, so that repeated bind/unbind cycles no longer accumulate
> remoteproc references and the remoteproc module can be unloaded again.
> 
> Fixes: ba929d6fe31a ("ath11k: Remove rproc references from common core layer")
> Cc: stable@vger.kernel.org
> Assisted-by: DeepSeek-V4.1-Flash and OpenAI Codex
> Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>

+workflows

I am no longer accepting patches from this e-mail address.

Go away or use a separate e-mail address per person working on this project,
with that person actually responding to review feedback and adhering to the
Linux kernel etiquette.

/jeff


