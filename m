Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07EEF606B403
	for <ath11k@archiver.kernel.org>; Tue, 10 Nov 2026 17:56:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Nrc2KHWO;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lSWZn6aO;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fyYW3JwH
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=dZUI5Qe+6KbAscqoiebvNwhOHw4y5pnZE9XdJ3jmNes=; b=Nrc2KHWOg2VBa0
	UGQQ4hbkeO37im7EvxYL+ijj1/zP/H8Q+X+ZZNGmpBbBFfzcbMPYthv02bamzlmMJIVJGK13umLHo
	E8sYDS3tGTA3Hx8CCuL4JeRuSShAlQj7RYID18r4VtQDOf3SKsyazfogE5lJazjXcU64h3Mklg1DY
	5ibRfkbdGgHocC4mMFnhEFRZMi9T9MU+7KXcKX1Ihu6TbB3NnF5UcGWSGRKqR+gzsWerFA1a3RE2M
	m4xCCUGi8nyZZtPlal9Io8mzoBNBW34rS8S8PNpsrCHIDHE1uBYY6nTFLKAD5s3K9uBzRmmI9ukg8
	nfmmx9tkR0yOA0AdiZkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQq5F-00000004k6r-1yge;
	Tue, 10 Nov 2026 17:56:37 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQq5C-00000004k61-2Ng4
	for ath11k@lists.infradead.org;
	Tue, 10 Nov 2026 17:56:36 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AAF04kq141436
	for <ath11k@lists.infradead.org>; Tue, 10 Nov 2026 17:56:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dZUI5Qe+6KbAscqoiebvNwhOHw4y5pnZE9XdJ3jmNes=; b=lSWZn6aOLce+tvG3
	WgvAUUKkWfeSDc2aOw8DZAnZlOmoT/1P1xsn6I2RsYmtlPQj7OVcZAbZWUYnmT+2
	dpTYQB18HK+4vUO/BbL6MmLr9ugAplJ6OMa8jrHjuIAADR2JOlYFl7iSpv6BJrpL
	VqScEwwntSwSrW0yrsJjWjZUXuQ0nfobMOpv7nGLC5TUJEmuDZb8Ju814jHM2nIm
	oUcBs5XVI8xNXND+/Oq4wrFk38A4bAFwKCK4a09+p1x/wwykwxBqc5GIUdECnsnZ
	Jyw4gl9zoZHZYGsekG3RVxOeioQt+lYS1iULO6KpNKfjgpAuvsAPl4iicCFR1WQ5
	qggyBg==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4humjg4q9y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Tue, 10 Nov 2026 17:56:32 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-36f26e6abe9so3732317eec.0
        for <ath11k@lists.infradead.org>; Tue, 10 Nov 2026 09:56:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794333392; x=1794938192; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=dZUI5Qe+6KbAscqoiebvNwhOHw4y5pnZE9XdJ3jmNes=;
        b=fyYW3JwH3+6YbPNN0VN/e8bEzObFy7DfKSJd79BnL8J0LUhIuxgUiSEwB8CtArXbqT
         BGIbvIKRvUbSiOnG9UrfKc7jR5awAoxjBKKatVoB7l4ptOxnFnMC/mzCudR35dUfNtS/
         43zrMiqcCOT48FTuxrC890THUH+hI/VkcLjVxovpj5fZaMMnSu3/0Fu8AWS9QUwwlQdl
         aO2CfKcJ253kE6E6k0aQg1iPnoGCXpYY91kgWnAPY79G9jnYScjbmCjuUjq7MIN+chAZ
         dEcUKkzaPM33hDvwaaKLgwc2n70YWOUx3zqhDRnR5TnPo4eRIQNYKPgI4LGNVF+zhy6l
         jCSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794333392; x=1794938192;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dZUI5Qe+6KbAscqoiebvNwhOHw4y5pnZE9XdJ3jmNes=;
        b=JNo45tyGdq+UlERg/oIRjNs7vQEb//lDNBcLG2nqVHedQ1x3q2KA2cAi8uy24fV7V0
         spFrt0Fc0mZbUIUEF1c6XUeuh/YHtzW9YMjiWgtjQsO7ZttZ4fKkXh3nlpbxBXQl4bYx
         8I3tHO+FnNJLiDc83roEcQGi9tTcwGKDy7lUMR+Cx9rNqgZo946eugL30hBaFW/gYjNp
         9WQjj75XEe/iNBVbyWAi9WTiXeL5ELM9bPQc3puPSVbR+f9+zqYciJ5i2M3PTPaMA1eT
         oIFQlCHfYrZmkHQwT2dXXE9hHHwPpuZ2uAP157upId591eoO0g8IQURVuqsb+QcMhnNd
         ZBLw==
X-Forwarded-Encrypted: i=1; AL+hErEKqNsZuVVjNIIK5OOt1gASH5TgV64Ms+JG9Z6MXcBepKjEDLMAvQv7gWydIzmk+QtZSaC/Wu8=@lists.infradead.org
X-Gm-Message-State: APuU4Z9bjA77jeqxyIGq1gUd9M6gE4Ia7KTwVOvhTv0rnMbd7X8bPHHF
	qk+fNUZVuwqgYXXDNjl9lDgwt32GVUxU4nbNcB+wWc2xH5ijToile8zNUfJ/7QE8q7NjqYIze8L
	e9u9jwAEGxgizL0WNVKQXgxsBs2xrMDX88SbL+zNH8N10dVKBaL7OEViyQ/kobyQI
X-Gm-Gg: AYBFou1WTowWrEPCnqf1EMXyfmrVqV1YryeJcA44h7GCG3euBra8M/iEypTc9SIH2lQ
	gdRurkdzkMLsYKi7zwyIXlvTH0DCu2a+dI+gq6Jla/CPhxUT6qBKC01m5Nl3JsviExRGjPFBZOr
	8b2aiZ75IfQxbenqSdfhwOAr+nnVuEXk/WNdXYF6QOTQekgtALFo1P7L6yY/RMw5iTXFE8bXgO1
	QrCOS+4wbGNXOCLroLKk+BMXOP5YYGU+CiHnMprJem394X0gQgDNUhEUsjQmz+GhMSGNj2PWaCu
	fCwynu+6jZZRaMXeuLjUj8H6+K9/B1tb653yTiinhRbR0CXInFa8+KGKrKN/UqMFUDR0qCTc6H1
	0nKNlBLBQDXQUC82A93j33V5yLEl1zkhK3biGVv9U83y/Oac/UgSxJ3nZu/iY0uHzI/g4Nviu3x
	g=
X-Received: by 2002:a05:7301:e22:b0:35c:ba31:6fef with SMTP id 5a478bee46e88-37686c3af76mr31644eec.36.1794333391559;
        Tue, 10 Nov 2026 09:56:31 -0800 (PST)
X-Received: by 2002:a05:7301:e22:b0:35c:ba31:6fef with SMTP id 5a478bee46e88-37686c3af76mr31586eec.36.1794333390890;
        Tue, 10 Nov 2026 09:56:30 -0800 (PST)
Received: from [10.0.0.50] ([76.133.89.231])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-375212ec002sm9766790eec.26.2026.11.10.09.56.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2026 09:56:30 -0800 (PST)
Message-ID: <7e7b67ac-7d7d-4769-be74-c064241d5426@oss.qualcomm.com>
Date: Tue, 10 Nov 2026 09:56:29 -0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND] wifi: ath11k: release the rproc reference on
 teardown
To: Wentao Liang <vulab@iscas.ac.cn>
Cc: Jeff Johnson <jjohnson@kernel.org>, linux-wireless@vger.kernel.org,
        ath11k@lists.infradead.org, linux-kernel@vger.kernel.org,
        workflows@vger.kernel.org
References: <20261103102915.1341148-1-vulab@iscas.ac.cn>
 <a39b1918-5d04-452b-8b5a-0703963f4587@oss.qualcomm.com>
 <179430684554.3011466.3431045638041318447@iscas.ac.cn>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <179430684554.3011466.3431045638041318447@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDA3MSBTYWx0ZWRfX5kFq5yOaz3bd
 BBW/PZ9SFbqevdyAFBOsHXBtSFI4tvJMHloQ/ICnjka3KNTjT1at4g1vypOYnZy3rUuNTPgp/vm
 u7oEfNAa88G9piIHHVHnFl5TFGevaBfFDMmrJZ+MKwte137tHwhW/FYP7Ndxx4t5RKARwI8zdwZ
 maUvbGiaa7mc+dyA8oEdehbavG72Zo1yf8VXQnJ7IL9K/T8NIoPslSWBVlQVBbtojze1INYmQxO
 sWj41H6Bdqn0rC++Lp9QRSXG1xAFzZ9ivMrrOo4kWxNii9NZjHS7shoedlU5oPXY9sKszxVYFMF
 rCWQirRRH+0xTVQEPKsAUCCbQLi/VDx6/mNeAm6P6BLSyZHxWib7J/14J0zvF5u63AgSyEuNVww
 GqnVjpCgiN/6RTbWZdWHA//6ElGLBtxiHA9l8zm34hPy4BOSfPOZsOg8qlVNYW8rLTPqXSoZCqh
 BhPyx49uYoW8VI9iWQQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDA3MSBTYWx0ZWRfXwaIlnJXhXEht
 C4PCNrK33WWFVHiaLxx/272Q47VWdvi3nXGJalsBCY66XEysZr46xQfwaTXS432XB6EETgwHtY+
 cXYs/gJxlWgCYuaPDRDHAtvodWSsj8s=
X-Proofpoint-GUID: 3jgBmxidU4DT-K1m0B94Gsh4lL1aOYEk
X-Authority-Analysis: v=2.4 cv=B6gsQ+tM c=1 sm=1 tr=0 ts=6af35ad0 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=6LbA7P6A7bvUEkAB8wivVw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=iW0bIAoc0toShNrrW9YA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-ORIG-GUID: 3jgBmxidU4DT-K1m0B94Gsh4lL1aOYEk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_05,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 suspectscore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 spamscore=0 malwarescore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611100071
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_095634_753880_A00C3D34 
X-CRM114-Status: GOOD (  15.74  )
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

On 11/10/2026 2:34 AM, Wentao Liang wrote:
> Hi Jeff,
> 
> I'm sorry for taking so long to reply and for the confusion and extra
> work caused by sending patches from a shared address and failing to
> follow up on review feedback.
> 
> To keep the existing discussions clear, I'll continue to reply from
> vulab@iscas.ac.cn under my own name in the threads for patches I
> submitted. I will not send any new patches or revisions.
> 
> For context on this submission, static analysis flagged the candidate,
> and we used DeepSeek and GPT-6.1 Sol to assist with reviewing it and
> preparing the fix.
> 
> Again, I'm sorry for the confusion and the extra work this caused.
> 
> Wentao

I am not going to accept any patches from vulab@iscas.ac.cn since the git
commit history shows that has been (ab)used by multiple folks in their SOBs,
and hence IMO violates the DCO:
    Signed-off-by: Haotian Zhang <vulab@iscas.ac.cn>
    Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
    Signed-off-by: WenTao Liang <vulab@iscas.ac.cn>
    Signed-off-by: Xu Wang <vulab@iscas.ac.cn>
    Signed-off-by: Zishun Yi <vulab@iscas.ac.cn>

If you want to contribute to the drivers I maintain, submit your patches with
an e-mail address that is unique to you. I have already rejected all patches
from vulab@iscas.ac.cn assigned to me in patchwork.kernel.org.

/jeff



