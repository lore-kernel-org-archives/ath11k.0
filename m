Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9442CD5BD1
	for <ath11k@archiver.kernel.org>; Mon,  1 Jun 2026 03:25:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/JZ5XV2N5cB097839qKqC08HOp1yb7LqFEmLdGxS4dU=; b=XUw7Q2TnSx+9Uo08c/S44Z8YXb
	4QXws9xwvgSN5K2GZtPoKEJ5AW5rt08AUHx6oVd2vSP+YdnjCexyhRzPZK7Y5eUp3n4m7w9Q2rJGM
	zZTGUzXYjMEY7VknFN+39Jnr/l6zm5xDuUMFOnGdhngkFCU4lSc86DsxQtVS7glVAWqq+jtROiQis
	2axW34IA5z4Clx7Knq3wonnDck4FG7uo8xr8RFs3Ef3Tr+RRbOoBuiNEevL85BPXAzD/AdAlI2/0+
	Fo30Ufa6m7vta8ErhTyRYFdySQghP9FNUq3fobCsVns81BBHv7lMf0OpGe0PbZJrx0tJIL8N/I8lg
	/GYE9xYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTtH1-0000000A5Xw-2GMW;
	Mon, 01 Jun 2026 03:25:07 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTtGz-0000000A5XZ-0zSs
	for ath11k@lists.infradead.org;
	Mon, 01 Jun 2026 03:25:06 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64VBdA6h1642824
	for <ath11k@lists.infradead.org>; Mon, 1 Jun 2026 03:25:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/JZ5XV2N5cB097839qKqC08HOp1yb7LqFEmLdGxS4dU=; b=QH8QI07DCs4ZZAJb
	AjC9H1rpICoohuuDzltFQCgTkh9khJo9+XOOIwU8iuWlYzAF4cS7UXFTxoG3ikPM
	kr7dWcOQuayaiTwvkUJJgN+BVOIJzEAK/Z+hwPdj/LROPEf5z3mtoNFjLvc3ui/3
	7J0bf92+YYvZrFLRseDYCnJy0AhgB8hDQ5yQdAP31evdRTTod4u4cnIbQB0pS3Q6
	MJIcq5IsOZa/N/C9cPMKcmyTH8lC8ArHZQYkZ75lC/HWyFDyeVAWTOasaKfoJ3rd
	KL3INfwklejBNxmAzOsyupb5ZzANPEst9pbltPRtGuiWo5uxsskJVCpdykqMxNWF
	s008aA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4efq7fdhr2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Mon, 01 Jun 2026 03:25:03 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8423f3e4728so519770b3a.2
        for <ath11k@lists.infradead.org>; Sun, 31 May 2026 20:25:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780284303; x=1780889103; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/JZ5XV2N5cB097839qKqC08HOp1yb7LqFEmLdGxS4dU=;
        b=LDQ1Zq99pR4h6jSQmSN54K37s95IaUZuMarp55fLvECkM5d1g6VSxzITU1nzA4yPlw
         DmUsd5cz0TEzyflzV9A23wmIQxYSSK4mhnu99P1OPiwXRay9wXVUpffju8YzClIcxyjv
         JrCdS9e9nNCki6+PbVHXyKJT6aSxltSwMI5HQxw3X1oZ04w2xwjm/XfePj3UVzq8UvbU
         KtTC7FyQbF957ydddtSXaGfvicv56ltr16ve25JIjHe+Z9x0xmOvWj4ewai2e02pOjE1
         j/V+hr1IVY8528cn6ndXSJn8WjgRSWxZh5IYCaH3T9n4/kQtu0NbtPgQhxwjvYTlaKmu
         GyEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780284303; x=1780889103;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/JZ5XV2N5cB097839qKqC08HOp1yb7LqFEmLdGxS4dU=;
        b=I83fQkQ31jCwmxfu3eONOBsPogx9zEreuz1r8S/CCspixo1ezlEf8gg9UKZSC81Qw9
         Jb1pQaAk2j0ecdvwq1ShzTQKwsB84qv7TkxAcI9uFg/Eu3QjnbLuGLytuNkQOVuOZXKO
         S7wwKOgDjgbzswY+hao5PZSPWLWHpcFMbveh0BnvMqBk1IlKbB5/wS9WzKsySQSt8g7P
         yi2ZscFoG9qplQjOg+E2fTLkZGo90NCkkns4Z5lzpp20pS2EExxa28UP0Hk290dwna/L
         bMUbLgtGZohDMnjfxhRxAxwmhcWQwIsQlvdL0q85oThyTTSsP83RnP8901sJFTqmC7MG
         anMA==
X-Forwarded-Encrypted: i=1; AFNElJ83cLVIN8qSS9kbTDVF/YEzEoMA4mSkc0S9DbhF7ql2xkEtdeBfloNx04/pxVQESc+RPMcyEsA=@lists.infradead.org
X-Gm-Message-State: AOJu0YzuAoaHnXACGc0mnm+UFalfXl8KAKammTjzGcD1ZqUYpOSZX3Ft
	qlmIpB3Ksce2EIMwHNpjyV7e7OUXD77OBpiPSKuYCKCJTeQKehC2nJufeDdjld6L5yLEMIIyTHo
	83BhPqHy9pa2I0lDuZyWVf4tC/LEaqIEZqj/vbv/UjxLFPCJIQXK6QryiVC5hqD8/
X-Gm-Gg: Acq92OHeU9e4eMCmVIVqRIo2jfeGMploIblUPNX04Iqq9grnyIe4Ri21kEcdsj2toQ9
	0VSJsWJTanja9DeS7+lH6NsBAyLa47E4zA/umheHJf4cyP2pvaFi+IfJRXnMN7GDFcy26wUa2Cr
	F1yLgc5DW6lNEYUdnomFDqSaRGj/yw5EaDKp3qtGkDN5P0mjFAVOgCWUr//gRgcrYezCxJ4a3In
	4lZvIrz6H6H6NhoUMj5ftMXCYQxCqNpTDKB2od8TGrB3ld9TM2834zs1YnKpVCyEH9MavA0+tfM
	b4Qy6ZkN2rXFu8flKr4ZY+24SxSGRS16yalsuOgcet8XsPt3Kqlv0R6ecoaefG8UlAhgtfgavOC
	Bsc4WtUAH/CrbwluUrgFhlsJ2eKzRb8zyY6ok8rNj6wkADPlQV6UJlL128gM6NIH4gep1ZC/DX3
	7caqn7Q1AFdLBKJMTajzJjY8GTO2Ce
X-Received: by 2002:a05:6a00:1598:b0:842:3373:f65c with SMTP id d2e1a72fcca58-84233741221mr4676272b3a.15.1780284302908;
        Sun, 31 May 2026 20:25:02 -0700 (PDT)
X-Received: by 2002:a05:6a00:1598:b0:842:3373:f65c with SMTP id d2e1a72fcca58-84233741221mr4676250b3a.15.1780284302455;
        Sun, 31 May 2026 20:25:02 -0700 (PDT)
Received: from [10.133.33.22] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-842263539a3sm6960360b3a.44.2026.05.31.20.24.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 31 May 2026 20:25:02 -0700 (PDT)
Message-ID: <0c3a4a00-8d6d-4432-bc11-12d0c5742286@oss.qualcomm.com>
Date: Mon, 1 Jun 2026 11:24:57 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCHv3 ath-next] wifi: ath11k: use kzalloc_flex
To: Rosen Penev <rosenp@gmail.com>, linux-wireless@vger.kernel.org
Cc: Jeff Johnson <jjohnson@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        "open list:QUALCOMM ATHEROS ATH11K WIRELESS DRIVER"
 <ath11k@lists.infradead.org>,
        open list <linux-kernel@vger.kernel.org>,
        open "list:KERNEL" HARDENING "(not" covered by other
 "areas):Keyword:b__counted_by(_le|_be)?b" <linux-hardening@vger.kernel.org>
References: <20260428205017.26288-1-rosenp@gmail.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260428205017.26288-1-rosenp@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: vuOQTCHAAy6Izg4PV_yzGW7AKY8ydWXR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAxMDAzMiBTYWx0ZWRfX6LOoSfqeWDTO
 d6hBM+J19R1eWras1OAqQsw8ocmXD7wq8iZhg+Ko9KQ1uU8rhh2POnLdYXS3Fs/vB7N6DbhGnAG
 nPKq6zgC7DVGDTm10ViKdlDjFZYsXNc6XgS/DwzHFg0SNgXx3lut1KvDtj4h3wD9qeue9q1ODNb
 eHr8DK9VjoSxDFbVvRGxerfLE5TKeHFI+xGF/lf4bJtgCcGeoMq2lFkPgtpfSgteuMinDSiQ7bW
 G1b3xvEuRIKdn8krc45RGJ97ABwaunOGbPcs6am4qBG9fK/s9JqIu03xaPDivmEkoLKzWLGZZ73
 zYxZL0/94eEy0Qyo2PuRdLjl/goOn4aPvqePKVzaWAR1J6eYJtbr0uPin+lZx7V1oItMyynp2Z1
 mVOCk6eJ9snm0PqxuaFrI5U/iwR7Wnjh9jprFDGSD54sOOK4WvvZ4ekgMMJtMYsIdyyS+EAByVo
 JP2zkJ0cBjeqde+8+4w==
X-Proofpoint-GUID: vuOQTCHAAy6Izg4PV_yzGW7AKY8ydWXR
X-Authority-Analysis: v=2.4 cv=XqzK/1F9 c=1 sm=1 tr=0 ts=6a1cfb8f cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=rJ_IYOnZYG8bJ-BjWygA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_01,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 adultscore=0 clxscore=1015 phishscore=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606010032
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260531_202505_402756_4ADC4F23 
X-CRM114-Status: UNSURE (   7.54  )
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



On 4/29/2026 4:50 AM, Rosen Penev wrote:
> Convert kzalloc_obj + kcalloc to kzalloc_flex to save an allocation.
> 
> Add __counted_by to get extra runtime analysis. Move counting variable
> assignment immediately after allocation before any potential accesses.
> kzalloc_flex does this anyway for GCC >= 15.
> 
> Signed-off-by: Rosen Penev <rosenp@gmail.com>

Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>

