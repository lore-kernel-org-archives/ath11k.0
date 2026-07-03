Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2024C44500
	for <ath11k@archiver.kernel.org>; Fri,  3 Jul 2026 07:03:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xLjqNjE91E9tE38yfvP00apwIjFuHuQeDSgtrb+rTTw=; b=Q1YUh3wV+yikBZzeuI5fvxgbBH
	9zYI2FyDGbqufdXXBouDzSHhALYUq6ntgqirR0HMmciW85o2YF5jhAxgSR+/Rd2JA4szzLB7SE50+
	RKdrj8g777ltEjAEM6bDxejX7RaLO5I1mozqmN1/1JVtKVcF/84D9fGN6tlDXWOlVIKkh9xzgy1O3
	r98SaXgcBXXJs6b+2MLx7zZXxZUfq1/cpRzlbFPSEUVigmXg62udjpPrD/VDgU1cXSnWvmYYZHQil
	b09KZpt09x36MEFDH+RXlLjXHP2FuB4HzWDtgLiDdc8r8EMdrTymADea3uhJcCalw907TEoJ3vtr/
	G0x4SrBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfXvh-00000006Eag-3otv;
	Fri, 03 Jul 2026 07:03:17 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfXve-00000006Ea1-3DX5
	for ath11k@lists.infradead.org;
	Fri, 03 Jul 2026 07:03:16 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6635rxpj3109544
	for <ath11k@lists.infradead.org>; Fri, 3 Jul 2026 07:03:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xLjqNjE91E9tE38yfvP00apwIjFuHuQeDSgtrb+rTTw=; b=LAg++SWTpblLbrBA
	SIcv8/z77S0AxnOGptOBEiUPuGfIxkfJ8sJRHSlc1zfxf3vYh1U0oFZDAWaKnUAQ
	sTTdLXPTlFYnDAdGdH9qG0u+oJXsy6YL9q4OfyEqyvJoPpdJiTr9zBGA6JyY1gAH
	v8Jx/x6OoeI8mxWUu3P8C4TriGxaf9HYuWtCT/Km1Bwrnp1mIHDwALB0iARtZd7+
	LQ0/E6H/Gw+LDK30Tl9MHMDUTUaxEr+0I8Lv8Tffmy2r9Pa5fihyuF4hqjyUZDlx
	IVDZpJIAQd30jsViErpuQZYizSNI8yo6NkhJEQUeg6wv6UVBFobPDY0uVGaPSOFl
	3ErZfA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f60ey9sg2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Fri, 03 Jul 2026 07:03:13 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c85a298cd62so325983a12.0
        for <ath11k@lists.infradead.org>; Fri, 03 Jul 2026 00:03:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783062193; x=1783666993; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xLjqNjE91E9tE38yfvP00apwIjFuHuQeDSgtrb+rTTw=;
        b=O65FchITxSQ0bizA8QJfcavi8eDoM/Qk1X/ZFlM+KAq9oH/SiQ7e1bc6B7vLC72QAC
         pC0PX4DXbhOCD5HaQm6N+h+/RRyITHfVUtHkYYOoGfBHheubSrz4EbE1wnBM5NVivq6e
         QCzxntAvsJqIzfsnASzyD0zzt6MCgn9XF2aJYehyJ1AbA+HGkGdO4GZ4WozIp/SAJVQ2
         wMd2R+fMbrliuRQjcAO5VMLw/seMewOmj6tyUljtDhE+iJb1JBaKbENoQD/Mla4I/n7h
         U4Pomw0zFFguzRA2HNkDrk9zZTtB0Ri2fXxKZzIC5xRrl6raNj60m8jatQwQmQUdjycB
         F3kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783062193; x=1783666993;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xLjqNjE91E9tE38yfvP00apwIjFuHuQeDSgtrb+rTTw=;
        b=Zv6vNp+2ow/CQAvVTvgflxPIcs+kKLa7odd0N+vPLKpBgScYqKi0ZsWZQSn3TYWZlO
         RWuOP8NwBQDnEBmdUNBIbC23n8OzYnDM+Nrh9WCbIzrM5SgzwWCoiDACGxsNjVFWBz3B
         rMdZ6yWfBGX9116oKMsq3rYOQipT/PfyCqpJTUFTRtPGYd8BfQ3lHTqaN3AdwLVcat/M
         peKnveI71iGVN+FxxcE6XY/QccfasglEwz1G/o9cMvsm0bdtVDmZARI/hV8MSUUMaJn5
         1LC8EFXlHL8doHK4A2Rsn20k8hwHqsF7u/ExK3FgOgL+U0X8S6AjwAWQTDzLhK4vLmNf
         U7jQ==
X-Forwarded-Encrypted: i=1; AFNElJ+UhJ74k9qu/d0rNLPmdRVtwt8Tgp8F+HHPnN3Ubvd254wwdwbp/DRsA65d0d3d+GtEkSCVKP0=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw/NU8f70D2KmJGT/h9PREtFTMbHRsWrxHP4dUHL5S25zmLYe8V
	SHY7Mp+OMAMHJTr5h9iM2Tb7tzT/vopG9ioM/pgZ9DaoyBEjkfGo2epbjhkQk5R1ekYRNegnEkG
	Mlbba+5DCwc15uX+1TAZs3dLF/ELziGl0vfTbdDIJH4Ps1me6fLIrhpmNRaboYFcE
X-Gm-Gg: AfdE7cma2TpseoEiz2K7ulKJbU67JbIG6cml2lFu3HVCjbwS1EII4cESNGB8XZWFjaD
	/XCMkpHS1J/JuPYJsVmQShMfL6su+07p87kgEq36LF2h5z/AZGMN7QDhm23d9IfgaLUgmlKgwbh
	oy45dKO6eQSlE4Mfok/jMCZsMk7Te0dRXSXjNAcU9qdiScNTa/3wBjR+CyZAbYAD6jejlhDH0kn
	RGCA/JbSuoF8L1KjddnADWb97zVYggL2KmZqJ9ucZGrcJOtMAavmxm11kdup+XolznsVgcUm1GQ
	vL2L8JHcBRkTyN16AqhtCIMyonabMd/Z4soB2/nl8J6/HTukVgqCc4Iqt1W23z1NxO+eYd3iSi7
	AXsZw2nP2YLSysOud3XD95K6kmcOHVjNMjrMQ8Abj4FgAiSx5kn7wN2McDcAZXJk+uS62y1nMPd
	ckfHpFf/Ow
X-Received: by 2002:a05:6a20:9187:b0:3bf:c126:bb02 with SMTP id adf61e73a8af0-3bfed4818b7mr10616377637.47.1783062192663;
        Fri, 03 Jul 2026 00:03:12 -0700 (PDT)
X-Received: by 2002:a05:6a20:9187:b0:3bf:c126:bb02 with SMTP id adf61e73a8af0-3bfed4818b7mr10616339637.47.1783062192136;
        Fri, 03 Jul 2026 00:03:12 -0700 (PDT)
Received: from [10.133.33.211] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c9e921d28d9sm2139230a12.24.2026.07.03.00.03.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Jul 2026 00:03:11 -0700 (PDT)
Message-ID: <d492b10a-7445-48df-b752-726e5c02f5be@oss.qualcomm.com>
Date: Fri, 3 Jul 2026 15:03:08 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] wifi: ath11k: Flush the posted write after writing to
 PCIE_SOC_GLOBAL_RESET
To: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        jjohnson@kernel.org
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        ath11k@lists.infradead.org, linux-kernel@vger.kernel.org,
        mani@kernel.org, Alex Williamson <alex@shazbot.org>
References: <20260623141649.41087-1-manivannan.sadhasivam@oss.qualcomm.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260623141649.41087-1-manivannan.sadhasivam@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDA2NSBTYWx0ZWRfX929BG6ObQv9R
 qiDaagXs/s316GP2siqK2nrht9dQH439icTlRY4yEMp2zaOE7XH3PJUCsA5pNLO2Uvg2e6F5K30
 O5XbdWw+tSbg8dwtmMQtGFGwHEV+F3YuNfm7le7caZSr8wr/R1QUxChJzHYWVmLKZaz3Q+3AStf
 RPhr2yPW/zB8CzEWRxR1nA4NAO7WsFtdpD/ce4B4YtaDsV6NI+97pD9GwCdMrbGF+V41IFIezZr
 cxuy9v0tZFzV/WgQAb//X7/YwyQI5rb0+3WUk17QKdzOD94MEqioxZ8iWcuX+eSSbP70HVll7Z7
 IL6SooxXpiPqnhnQ3U89jfBm8QBtZsy2Cwf70Ltx5Qctgz7OWqv+G4Z+c6ROqxAGiIroX0SMZiV
 hR9wSFRUFofP5Je1iYG7nJ6PfWKGbekSRxUofzJ0hXHTURZcJpdpTWXrIbWSA5HqaEVwvD9IPGT
 OJdj/B4T1zlBSFGGpJg==
X-Proofpoint-GUID: aStkXmG-edsp9aDENlzSnzZK6qI5LJwk
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDA2NSBTYWx0ZWRfX1Uuo2HIbKheS
 Tv1wvUFpnH+3ojevZhrWhKFtep7b6ArDFswyI+pUYWpv7iBuefccIsHiwtgib81HhJ8QLK+xWna
 FWVLB4Fe4LnIEzg+YsZEuIc5zL7GshM=
X-Authority-Analysis: v=2.4 cv=SPRykuvH c=1 sm=1 tr=0 ts=6a475eb1 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=r1p2_3pzAAAA:8 a=EUspDBNiAAAA:8 a=fjTVS2QutaehiSyZ5pEA:9
 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22 a=r_pkcD-q9-ctt7trBg_g:22
X-Proofpoint-ORIG-GUID: aStkXmG-edsp9aDENlzSnzZK6qI5LJwk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 malwarescore=0 bulkscore=0 priorityscore=1501
 lowpriorityscore=0 phishscore=0 spamscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030065
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260703_000314_928679_25695DAF 
X-CRM114-Status: GOOD (  11.20  )
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



On 6/23/2026 10:16 PM, Manivannan Sadhasivam wrote:
> ath11k_pci_soc_global_reset() tries to reset the device by writing to the
> PCIE_SOC_GLOBAL_RESET register. But it doesn't do a read-back to ensure
> that the write gets flushed to the device before the delay.
> 
> This may lead to the delay on the host to be insufficient, if the posted
> write doesn't reach the device before the delay.
> 
> So add a read-back after writing to the PCIE_SOC_GLOBAL_RESET register and
> before the delay.
> 
> Compile tested only.
> 
> Fixes: f3c603d412b3 ("ath11k: reset MHI during power down and power up")
> Reported-by: Alex Williamson <alex@shazbot.org>
> Closes: https://lore.kernel.org/linux-pci/20260622160822.09350246@shazbot.org
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>

