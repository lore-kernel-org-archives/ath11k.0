Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05446CD13D3
	for <ath11k@archiver.kernel.org>; Thu, 30 Apr 2026 21:31:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eUAp8M5vMPPiqO0kN1a+WvkD0dOAkUEpzEqiuezew0A=; b=hDF+/pkJxssFlEVBohudruNB03
	hCyFxxodXctOYyGR/gXOLaLYHBl7rafQVdanBP5W+QVKEYaTCRlHQprqBRWvRG8LswXvhXBZfDU39
	NOjxXdwcZXXil015eiZmTiIoh/kHVRm2LhEogCacGW5ha1qe/taFtb+LLMWANOiAMKkl7wohsY+oQ
	7d3mub4orL+qIcoNrQMdU+JMRnpMF7LCJ6B0xqTcdM+PX0pM8baD38xAQS4LB8XanMNrNaMJds748
	8qMCQYp/kfWArzzOxIqc+fIfVD8l/y8X/WAGtJ959ichIAx0aazsGvB4+pf7z1+YbfKXRxIyd4ZBC
	rwjnN2mQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIYyL-00000005zAF-20df;
	Thu, 30 Apr 2026 21:31:01 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIYyJ-00000005z85-3H6C
	for ath11k@bombadil.infradead.org;
	Thu, 30 Apr 2026 21:30:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=eUAp8M5vMPPiqO0kN1a+WvkD0dOAkUEpzEqiuezew0A=; b=Snxd8DrsQ5lb4TWk5s1snP7crZ
	nBAf72dDzqE33t3W2atzDKOYfF7bDJbgiUuOpE4j5IjA4a7Xz/ac2dYbUvqAlaR4CG8sJhHdzkToj
	m9yAG+qclxQKjDfMc2QJy1Xeq2RenB5SwC2Ox3976xKEUbz/47MLAHqObAfCB3VeKaCr5VgXw1LTB
	rdXgPmuEA+yXqAnvBpSmxyH75dmfjFeqrvuOAAp76/Ub3uKB5rkwVcFc2JGKKRxGHziF57DSxRR3l
	LyQoLzCuZY+6OGKW9Ay+orR9a0QwrzAKTx20f2yQzNT04bSiM6b+VxxFm02t9aA1M9JBR9ldYP3R4
	n4nEq3VQ==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIYyE-00000008B8D-0zQU
	for ath11k@lists.infradead.org;
	Thu, 30 Apr 2026 21:30:56 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63UHTBic088765
	for <ath11k@lists.infradead.org>; Thu, 30 Apr 2026 21:30:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eUAp8M5vMPPiqO0kN1a+WvkD0dOAkUEpzEqiuezew0A=; b=IZfXhnHE6OkO20+0
	7sEJhQzLk0A7Y7cqXdnKpQRMvlXVKHlUZG+SfO6nyW+NuAwjxDnsnPS34+ka/lme
	pVqD2bs4iiR89W9fZ2gGwi97hNbeU7VTDm2Hfw+VpgzPCXkmVTuEK9BG6M04rjI7
	z6jnurzZIq+fqPLDrX5PPxFxqniz7FwyUK1hIzyksq7K9c8fXzadLBAg+lozMIam
	dn5M89nAnFzTAc/CNehg/6LQLyysOBsX0kEHOXCknGIx2kPRGxdXD23S7a44jvCB
	sQjKu/eWJ+iJw+22fEgOZrzBvurzw+X/X8Two3z0wssGV6KFvNy31mWZsloCD4eX
	7I3V5A==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dv2u43ujr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Thu, 30 Apr 2026 21:30:52 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-2ee5b73c5f2so1596422eec.0
        for <ath11k@lists.infradead.org>; Thu, 30 Apr 2026 14:30:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777584652; x=1778189452; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eUAp8M5vMPPiqO0kN1a+WvkD0dOAkUEpzEqiuezew0A=;
        b=IKtpxznFmck2mapxyhNYO3o7CbYgtTpfNyKwyq1oEpsWZrHX+wpp2tlXkHMrPfhG3w
         gPT8FME0k9sCur0nTS+gPh/NjY12JehFVRv5Cht8pY0ffSwG1VzZc4kwwj2th0EbnM2t
         quylqVVp3wLERvaHnS4A/EqHNQr5g4+CPQwJXTKF7CITBXiH9bkW94ekeG1aR/hEMBkb
         V0RDLUwaYmPCYXDjuHTxZ7MQFxkGrInmT+QVWZVyU91FNUWaeMrmQd55SwUNAYQOm28X
         s1Zk3ulFd80Mb0L4AAVHn0TGZ03s/vUaV+/C1tOhypRtC9QArlvd0cJ6E0Xl8z1VKgnb
         8a5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777584652; x=1778189452;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=eUAp8M5vMPPiqO0kN1a+WvkD0dOAkUEpzEqiuezew0A=;
        b=qVtLdaPJj1lGUHgVYXNl82KGDLBYnAQz3HPtgpOJHGaI4hx6HzuN3h+vfvgW9irQo/
         s/cmNno1FsVTvsJB5LOV4r0SJI3+ZKZkt4BluBpOQ3tIMgp/lWc2o2bDGFZc1Uwk6L0Q
         2+tWlhM5TS7Is68djBcwjskMKJOQaQNlYTzR9Kpxc+HlGCNkr6mia8/YwcB2BWwn5JTl
         duJKKDIPsxZ4j57WF4KindRI0WC4FA2tY74LaPhIuOhyhjqmaKGuUUaAX6KBSdYQ1EtT
         Smqn+QpJ0Q5qp28ljvleba0AC0O+e11vuHxG1XlDNo0jAfI+M4aOZTYKYF9GBsc82EGt
         3j0g==
X-Gm-Message-State: AOJu0YxvgGrTprqlZj0BXxZs/RKiwB+vXPhMUrZClIErrGv8HgCPd/yb
	DWz8ZsK2fTgIGiM1Im23yixI5x34rGWCy442rtTtUD+WXB6HbCw68JBAZD+rH7uFbJQBD/tSaur
	Bp18VmUbd5ANDsJMqMGaGSt2MU/s2aT75tLHL800nig/MYkliBSVT8YBgvs71i7dS
X-Gm-Gg: AeBDievFLMaFEURIebZDCTXAscJqjvjKR1YmYn2IGMHxqHxfpjOMqG8w/dpqb1Uxx/W
	Ni4nxi5iDLPTpydfjafIXUf2hGfi2R+/q/wLwR0sMKwmOwjxCAwOlKx2XGte1GxUDQzmXF6fZG5
	E22nuMjtRZCKfcXv7S9axP4+PcebxayEhTUmx3fDg8NeDvwcNg4vnT4tg8KzetJbpk5DszCXU3S
	9N0ImVVNsj3s5brjdRDF4H6h72Ml7lXpTjzxy7v9idtG0EBc1NAwNvAGs3TlQg1RX67dDswiuQK
	f4C234ufnLG0KWszNm8B0Nc6gVbCLm49JHWrTM86f3RgIReuQz3pi7Ah+KeGcFxPHqBTdZV4JW7
	ZN8EO8HH4f0rFrkRe+XR55nLkWk3NNWyV7bkYGMQzZN+YxNk7ZpuNJGyxKftaqTXyKyP60h0o7K
	LBmvtRgngd2FE=
X-Received: by 2002:a05:7301:2289:b0:2c5:b23e:48a6 with SMTP id 5a478bee46e88-2ed3e38dfdemr2271183eec.23.1777584651930;
        Thu, 30 Apr 2026 14:30:51 -0700 (PDT)
X-Received: by 2002:a05:7301:2289:b0:2c5:b23e:48a6 with SMTP id 5a478bee46e88-2ed3e38dfdemr2271157eec.23.1777584651356;
        Thu, 30 Apr 2026 14:30:51 -0700 (PDT)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ee38d79eb9sm2504861eec.8.2026.04.30.14.30.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 14:30:50 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: Wei Zhang <wei.zhang@oss.qualcomm.com>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
        linux-kernel@vger.kernel.org
In-Reply-To: <20260404043050.3433754-1-wei.zhang@oss.qualcomm.com>
References: <20260404043050.3433754-1-wei.zhang@oss.qualcomm.com>
Subject: Re: [PATCH ath-next] wifi: ath11k: cancel SSR work items during
 PCI shutdown
Message-Id: <177758465037.1848985.7425474739277158142.b4-ty@oss.qualcomm.com>
Date: Thu, 30 Apr 2026 14:30:50 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Authority-Analysis: v=2.4 cv=Ev/iaycA c=1 sm=1 tr=0 ts=69f3ca0c cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=78yTA9ZnydsJoXb-eLQA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-ORIG-GUID: oCZXpbdQQCmK4igoReXDSuVfK0SdCRwK
X-Proofpoint-GUID: oCZXpbdQQCmK4igoReXDSuVfK0SdCRwK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDMwMDIyMSBTYWx0ZWRfX9Zc37onsrhk+
 zXS8wMcWYjrgbHtxP1qocS8QuXimGZDNOtrTJcmVs7g8gs/t53o/bwwJDNBjqRL9+yQnvGO+sEG
 p4y0KNtJtHLePMMvMd6mbrUIkGNoMqJEsHRQScNHRaTnYGJkcmTmHrk1QuwXblLKYGBRboRou8+
 LMMeOVqQoUxQ3galNjQYC2F8pVoFgM7vzvt+u32tOhRHVLBhJyOmuk3o4D86T4hiic0jBMhYm2l
 zv2YTkPMnss1j7ViQVHBQsOCcGd8ZwZJnw+3hp6S0lCk0rwHDPf3YIO8/94iLWa3Wp3lJJpoCSR
 QRezxGE8gQMiMyFXHh/OYOuhLIh5cRn6+rbxX7uMQPKw71apXx6ChAiQomySf7CIM7edIRhUfxw
 U06YzAL3Q/c0zUrIvKwBVBfL//JO2TmfEgSW+rvsqluhbnrSBCcAjM4fDdj6ygA3i3bL4CuFQdw
 h5UNuXL8Vskq2c6+W4g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-30_06,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 phishscore=0 spamscore=0 suspectscore=0
 malwarescore=0 priorityscore=1501 clxscore=1015 adultscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604300221
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260430_223054_918526_D9298ABB 
X-CRM114-Status: UNSURE (   7.93  )
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


On Fri, 03 Apr 2026 21:30:50 -0700, Wei Zhang wrote:
> A reboot can crash the kernel if it overlaps with WLAN firmware crash
> recovery (SSR). The crash is a NULL pointer dereference in the MHI teardown
> path while freeing DMA-backed MHI contexts.
> 
> Simplified trace:
>   dma_free_attrs
>   mhi_deinit_dev_ctxt [mhi]
>   ath11k_pci_power_down [ath11k_pci]
>   ath11k_pci_shutdown [ath11k_pci]
>   device_shutdown
>   kernel_restart
> 
> [...]

Applied, thanks!

[1/1] wifi: ath11k: cancel SSR work items during PCI shutdown
      commit: 8c79aac429b583301f387374ff37c59be671df87

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


