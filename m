Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F01C9C43458
	for <ath11k@archiver.kernel.org>; Mon, 13 Jul 2026 09:29:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5yNNGv3UC9KF6RYEoemdEOCJ06sbG6AZs3NCxBW8eIo=; b=whvEjsVvMzYXT88QOvlPBiCqZ1
	HRQ2i0Ki2HgAccWZfr3gWoEKkaoL4PVcyRcDCRZDC7kGw/lai6nQimvASuj3UUVvxGyQHyu0f4ocH
	Z8ampeRFb93ACT4s9p8jy6dw54wO50xlaYHIUgz0t8OWnwTjGTQtx4rCgokwY9TfGniVNCv6mEc7j
	2yppFNutpCvUhEgBd+g/ntaFDAyxeBFwgef7+SPhMriw4gqKh/JXDmz6ce8Qs2f5QndG0mgkqBU5X
	NCDV+2KOFONXYOXfttIxBH8mY8nrsBxA+zifnwc0sT46XQSoq59qc2cAvTzo9xEjyKNIQ+KWsK6z8
	JQJwYeVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjCyh-00000008jSq-0IJm;
	Mon, 13 Jul 2026 09:29:31 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjCye-00000008jQU-3bwz
	for ath11k@lists.infradead.org;
	Mon, 13 Jul 2026 09:29:30 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66D6Nfga731613
	for <ath11k@lists.infradead.org>; Mon, 13 Jul 2026 09:29:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5yNNGv3UC9KF6RYEoemdEOCJ06sbG6AZs3NCxBW8eIo=; b=mUA9kqd+2nLcrNNX
	3pqa1ncvCZSY79TJ/S2WaWEiBp4weBEYpu1Xo2lWorUGmTYUspoZYo4+vk1y/3zF
	mZn/Y8a5VddTpFRGDPAczJsxLUCLzSD1/JHB9NAzgi/V1VsUcryJmoqLDIeBIfML
	pMoJFsurtkF86giYIK5Up9CMm1EyKC2ojeuKSy2zSYsvdbr5LvkhS2M67qUK20J1
	rsVW+SygGTKzP5NlYMhzfS9VrdPMqsZeFxTf3iPa/b3ugE9SKAvQaE/EhzwKZX71
	xvHuUnpwa3AujmXh8RlOVVr0YD0SeN4WYXbPdmlvHB8PH0b0Odf4qvv2UTOX9LLp
	SjxlYQ==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcjn39urg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Mon, 13 Jul 2026 09:29:28 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c85798977dcso1609912a12.0
        for <ath11k@lists.infradead.org>; Mon, 13 Jul 2026 02:29:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783934968; x=1784539768; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=5yNNGv3UC9KF6RYEoemdEOCJ06sbG6AZs3NCxBW8eIo=;
        b=Vzm9Dkp/vuZhV15sonvai4wWLRKXfFWsOw8NdO0q6y//L9s775OWndAzxH+S3RuZA8
         BqYX9hlgkyP9QQlgulsQStNRNlkhXkUaIVzQ5h945MNoHM7ObQ1EtTW9WujizJH1HzDD
         YZ9G6pDZLEykdYGK5D/8cN8ofEtYAzXnAblyoyglkBhUbxut8j15G6o0Vwmnxh4wDbkD
         m83URmUUoan++6CPRuEfzHg6IyeJpO+J3n+BY7mIqSuH0UfCmqkQm3M4glfzos8q/wLy
         WCDRh/ObQsoGS3QnJ5+hy/te/+FqcCA/U6ZZ7NyvWbwlrxS9RqqTG5NhdUGjVAh6xgHu
         R+Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783934968; x=1784539768;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5yNNGv3UC9KF6RYEoemdEOCJ06sbG6AZs3NCxBW8eIo=;
        b=Vdv42EWlu/caa7IexTdwq4/QVI53oq550ie0mjJMpypiTgwYIrJy7g4D6ludXao7ur
         xtQcCL5S8AEALcpMDfB5LSPV+1v2OVHTNmGk48WChRujPGxpFOIS9P94oiwsO42Oeqde
         ABqi7VGoHsBPVQSof94JvPKLdMxPxAch8AQZn1zCs8OCkUvzpD0Rwb6TrJodUhplxqV1
         VfrZw56Af0tnLxI7Uh+EN1ShMJRiD0OOkk06ySic/QkLQeXREP9rOrtUxvkzTSG6YIee
         fXYivUBx9rhAu6RbB6i990qHzFc+lS0ifs0Y87jyBdXtorvI1sEq2FIk0KHUpkhowP/6
         buZQ==
X-Forwarded-Encrypted: i=1; AHgh+RpmjmlEBeMfqqKa4eFJC0pJWDAE1T+9tdTNUOFz1GaffgB7OtZJq3p6fJ7/47uPc/YWQ9Xzbfg=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy9Qh+HKlp/rVINFWaLp3AJQMU+T8GNAR5OVeWmqFqz1zJJ2v9H
	hCIwy94HKyX274+F2TlIBXCKToqQWUx79aCQNXRqA3sT/BM141j/2lAW8d4lu53vKAchoVPWC0f
	fFhZqPqoBVAr76DaV8z0WbmcdR0SANsga7xIWmIJQKJkiN354zWHelwrghfDuEHhbH5khJcCb
X-Gm-Gg: AfdE7cmTCDYZX4q3j8V6A/xF2ux65OyesaBKueo46Kja/ENRH5hOSzEjKP6DcqGGh6a
	V4IfldY14Z9JbXFQSQwIdkL+pf7MhlsS3RS73D5xKUDfIp8ZjGWoB2tNhbYj0+r7043xOaLzkyX
	ll6uF8y8VL/zVKXVeukLpJ9yPRIIbm42o7yehtDGByYgK+7NeWEUTR+RS14Q+FhNNrsEoj5AWaC
	+aEy3bmCHnsJE6wzztj5f650a0rJxCeUhXVR/SCndYw3puR+xlj8wjMjQqnh75h8PUpDM3MH5vL
	hd2HePG4dlXuBEf63PlN5M3v92dxmYlKMQqInV1rLrBlVr07JpbvrwY7Bebot//gPgVeItv9Fbv
	utdnr6miVS+rwmJUSc3PowwaO98bBHVC9BpTdwKNmsGFJOGjeRHQ=
X-Received: by 2002:a05:6a20:3d06:b0:3c1:b9c:4890 with SMTP id adf61e73a8af0-3c11018d8camr10981088637.22.1783934967828;
        Mon, 13 Jul 2026 02:29:27 -0700 (PDT)
X-Received: by 2002:a05:6a20:3d06:b0:3c1:b9c:4890 with SMTP id adf61e73a8af0-3c11018d8camr10981064637.22.1783934967414;
        Mon, 13 Jul 2026 02:29:27 -0700 (PDT)
Received: from [10.152.199.23] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b8fc7c088sm20140006c88.2.2026.07.13.02.29.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jul 2026 02:29:27 -0700 (PDT)
Message-ID: <bf3f982d-7d5a-4573-ae34-6e972ddbac8e@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 14:59:22 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath11k: validate regulatory capability phy_id
To: Pengpeng Hou <pengpeng@iscas.ac.cn>, Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20260704011040.26233-1-pengpeng@iscas.ac.cn>
From: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260704011040.26233-1-pengpeng@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDA5OCBTYWx0ZWRfX8BVIZEhPu21O
 plSkKQgrx/JAEuIINLgrFc+kByaqRZ0V5nxHDXhR4QQ408u91ydkh47OADbc0QOTUmrGxxvBydZ
 j+7JTrDasIqSPAIxfzrM1Ztcmv6bXiVQilwd/8fORheoKNPxRMRayD6eIvPlmYBhbPm5lDWYXPU
 169OSgzKZ8n7hOWL2N5GUtMXk2hJ7PPPx3RAbOWy1d1SFE/T4JhrSyN8wrdza9AUXKbsTReVKJO
 1myU5q2H4JQDEvIyfvUyMd+qAL+fUau/zScoNo1N7BGDX7MHgalwHF0WgeF4C2zPDrtFk0GskKV
 S0QceLs+ncPQVlAujvzxwDgxMHnC5wQG5oTTv8ASdSsHPHcMh0zCkHnDbXTnrFjACuzPxdN+0nV
 GMbx6O6SvCWK6Pj5GmbRsKkQTw2g5927ES7k/6ZNZbWXw7T35fbzeJ/fa3IulK7TW8TXaYgPTJN
 ITMkFXRKdTPDXh2cvCA==
X-Proofpoint-ORIG-GUID: jr7wJbQW1chkFOeZfCuG_NNUtD9Fchu3
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDA5OCBTYWx0ZWRfXyKRFVrYrZthp
 WDakD7azyLbtYrNVpDg6W3wetC5BFlSqOY2Ibwnq/KdwaX618LHAFG0o49ljSLLsh/KSUiOm+Pg
 zc7Hvq0gkmF4x/4maDwVcerOvTTDATw=
X-Proofpoint-GUID: jr7wJbQW1chkFOeZfCuG_NNUtD9Fchu3
X-Authority-Analysis: v=2.4 cv=aaJRWxot c=1 sm=1 tr=0 ts=6a54aff8 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=TIgdfdpnsFF7rSLKS_gA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 adultscore=0 malwarescore=0 spamscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130098
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_022928_907696_39AF6DBD 
X-CRM114-Status: UNSURE (   8.84  )
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

On 7/4/2026 6:40 AM, Pengpeng Hou wrote:
> ath11k_wmi_tlv_ext_hal_reg_caps() copies firmware regulatory
> capability records into soc->hal_reg_cap[] using reg_cap.phy_id as
> the destination index.  The loop count is bounded by num_phy, but the
> phy_id embedded in each record is not checked against the fixed
> MAX_RADIOS-sized destination array.
> 
> Reject firmware records whose phy_id does not fit soc->hal_reg_cap[]
> before copying the parsed capability.
> 
> Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
Reviewed-by: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>

