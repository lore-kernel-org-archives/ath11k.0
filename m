Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80003C55167
	for <ath11k@archiver.kernel.org>; Fri, 31 Jul 2026 08:52:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xl5ePMbIiG1ItJgNEqxcqTd1coZwPOYQkPqbXF90I1k=; b=IvalRNFJ8F67moWAk7Z3E823Dw
	hItx5AQAV4HZFTCh0w8h9DxKnZ+atVZRwl+1XI0kmYKNBNEdQZGJmDLuJuKTA/xmUY6lb3fWNrEmc
	k+q3CPl+RnMfRVQTGMMQezL155rgG5mzwY48SwaMb0sDHdsTaAkZZ/EbtwjKrIM0QjW0BonQpVG0m
	Su8+HPJCvkUVKaqz0WEjdvx15quZCJjPuxTyOV4GWqDznIr36WmjFYrws81sbzXlfm30TSHld5C+T
	3rHh+7d7thnIMcGvjYbod/09GJZBzvXv+kx9OTpJRnkd93F0F4mratWQ5FXcPojUCV0Za3TgNz/LR
	fm49qCkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpiyP-0000000C78s-2TIk;
	Fri, 31 Jul 2026 08:52:09 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpiyM-0000000C78Z-30jV
	for ath11k@lists.infradead.org;
	Fri, 31 Jul 2026 08:52:07 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66V8lQ8B2991345
	for <ath11k@lists.infradead.org>; Fri, 31 Jul 2026 08:52:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xl5ePMbIiG1ItJgNEqxcqTd1coZwPOYQkPqbXF90I1k=; b=iYbSb7jv2lru7ndh
	MWbpopBtz3bGkecfvT7UYVukzwjqm38O5poQtf/zoy8HNVTsWPGp9S0t4sAF4h+/
	2nQX+H+9AK8F93RTRjDbrEQrHbADH0y5/fVSfMG9LSJwRIk8znT73/88sS1NJrDW
	Xn3TAD68ia7It+ZnpqfQXhOJL91OQ6Fc+9KW/HKTC6Xl+dsg9JZ5K+DKTSeO8JpU
	xCr3IscLoGAFpbCO41dbNQLOv519ycep48GIAwx6LYfM38u8B57UO8LOsjMlqaAZ
	PaJ7MV9txUWU2UcRhrHEZmJsEZJ2UlOQSg7wTo+paxRucQBCLZT/J9z4EtJLvlDW
	ry99bg==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4frrgpg0hq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Fri, 31 Jul 2026 08:52:05 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8487eb67173so1615386b3a.2
        for <ath11k@lists.infradead.org>; Fri, 31 Jul 2026 01:52:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785487925; x=1786092725; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xl5ePMbIiG1ItJgNEqxcqTd1coZwPOYQkPqbXF90I1k=;
        b=ejSKHOtJDF/dFkzPFwwBe9XVK9yTxZDTJZTefV0WxTTErWw9lniUPfoUMQd4426CMJ
         WIh6fUeBXC531SmUMyvx3+JpGlS/m2FkC9QaW+Pftiv9VaYrwQXgNlB9UHYIUFZpVp0E
         UczVQS+EeqRdOcIVnV3VanO9+GkTqx0jAfN2YwpvEvZEr91DtR9JOv1zCDQV+TTI5fwY
         kEdzEoLmrNbym03GIUI0meVnwkg1ylpZ1PcV4eCnO2G/RyLpkATBosSvGDBfE5T3aReG
         pduS2LeGJhRFdMm1KxKpCCJYMBCOfsn0lq8gCNm1pZiRIFV20d50CH7pNsmxg9fGfQ3I
         6vRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785487925; x=1786092725;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xl5ePMbIiG1ItJgNEqxcqTd1coZwPOYQkPqbXF90I1k=;
        b=rQjS/nsq8iKXJVGtpMgHKIn9VDHRJAOsJuvjDFgOvwShlp4XnrkixoacPwMkwoo7RA
         nUATNM4481nmnjXcmdhVpOVmZmKWUu10CGaTFCx4xwzZjqRtr62c+mTHr5BGU336OmJY
         0kXbwDzrW1AL9i93q+IzTNWgnhGleuYFHF6t+j9YmSQS6ulnxYzoGutsSjhc6pg/0g6Z
         de8GzxxlhC/Lz9MORhJc9ZtI4MwwEqp7c2zxmPEvWHIz/hFGAa1G8/pZ9l89EPMZXB4p
         xcpe3Cp1MBFO2XMZdw49ip/16Efes2W1r6yFR03gCdCh7ZWd2bl/Eq9+QBDXOcIev320
         ZtZA==
X-Gm-Message-State: AOJu0YyVyxigohxRXOh6wX8WsdBOv5hr4VwyTSvE+OzGZ3pZlvHnhz7a
	M2yXvnR+DqkkuOFaYdV0CC3kvAxle52h2sMctfeTeQLASLqthZ8rGbzihfDjb1CheRxrKt+yFub
	Kp1D8WxR+SVBs6Suhbhxct8ebO9mStN95k/XSYFcfK4iKDDrz+OOcNY35kui4LmRP
X-Gm-Gg: AR+sD10+rka64dMUbetSflAX2ZntuOCSAEEKDxWplIwNZSVTq8JN7CXGvMzEGN8VqMX
	a9oZWZgMIk9zLR1UJDbT2wF7iFeXUCV20M11XFJhPYLhn9KeW2JxAlehtd61b/0QCLFaMM+VxxH
	cuehPFFE8AURsS0KdriUqfXtszOB/6XBhfdEMn1ix9cjO3ykv+S9aEN1ZrUSWS/1bYGiRCEk2Cs
	LNWhthdWHsRuDX392kHnGVKTH27Sgx+UFzuJ9qfgycMsFSQobDq6ml2/ClhBOQpDYaEf5REkIA0
	YW6oXizy/z2o66agjnLYX80AZyPIsIhKwSoMcZYwg6SYNVWT3x6En2PB25M1HWZmdlkfh6toUK0
	wHEJnbv3GGKUYJXDRSzK2SP+I4Gvnl8cx4wl/o/XEhhiNpk+ggDwkxCv17bkvB5q547niJcGAdA
	==
X-Received: by 2002:a05:6a00:4fce:b0:847:df4c:40c9 with SMTP id d2e1a72fcca58-84ed719ee7emr1021620b3a.46.1785487925087;
        Fri, 31 Jul 2026 01:52:05 -0700 (PDT)
X-Received: by 2002:a05:6a00:4fce:b0:847:df4c:40c9 with SMTP id d2e1a72fcca58-84ed719ee7emr1021601b3a.46.1785487924655;
        Fri, 31 Jul 2026 01:52:04 -0700 (PDT)
Received: from [10.133.33.123] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84edc2d7bbdsm162774b3a.47.2026.07.31.01.52.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Jul 2026 01:52:04 -0700 (PDT)
Message-ID: <c07deb05-0422-4c06-af72-755c26ccf2be@oss.qualcomm.com>
Date: Fri, 31 Jul 2026 16:52:01 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RESEND PATCH ath-current 0/3] wifi: ath11k: fix QRTR readiness
 related WLAN initialization failures
To: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>, jjohnson@kernel.org
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260730030948.147892-1-miaoqing.pan@oss.qualcomm.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260730030948.147892-1-miaoqing.pan@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: QzDo7IF5zJopOQHHHt1FE62jVOM3xjsW
X-Authority-Analysis: v=2.4 cv=SK5ykuvH c=1 sm=1 tr=0 ts=6a6c6235 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=Jsd1VwQIYPtyK_QoHY8A:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMxMDA2MyBTYWx0ZWRfX4rLDuxSF0Wg6
 KjEkIaSvOiB4k9umdPvhEs/EaRCNQSSCLF2aXBcSAPWR/cYk1CKF2dkSHY3+csYzHoj0h7TDCSo
 VmqCv3k648ecxWghO/lYQNX4cwIp+sLi7Dqhn1jAFxMDaW8B5UqHRxwNPpm5gCkbGKQcZM0wFVW
 sTN/6jhJ79FzlLR6CTXdVt3zyqCYa/mn71ml3K6e3/xt4oIESCkqxnE3zExSEyNDjtdCMuO+FY/
 BhZw9Yb+wpNJ8hOBqH45H27ABXaTEIsqoWm+wmIwwAgKWI+jc1/wnMHKWUO/tdFh27elvGSK0gL
 reohkOvfkFkMgl11oyeNHDr9GdbjHIpgmWxQKEdWe4f//iqe5LRl2gTs7m4KlRODfy54Hvbis7e
 eBOz39DmS1Ez8frFHPTMqW6wJDdLKt0TeEACrnazfx9r/bWhX+k24fchz7uTpNfjKJ86DAm2say
 8ZBgcEQQJ1l0vCVETgQ==
X-Proofpoint-ORIG-GUID: QzDo7IF5zJopOQHHHt1FE62jVOM3xjsW
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMxMDA2MyBTYWx0ZWRfXydiHZ0xxG/uB
 Q6GeK0Y/POHXM/52lqzdK6DAMh/ha9xMSF6SjKI4E02XiTGFbuau0mu9+Psm+aRnG8UGgx/Uzqm
 00oScjMKAAnstKxOeIvkq1XJnKkZrKY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_03,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 suspectscore=0 priorityscore=1501
 clxscore=1015 spamscore=0 impostorscore=0 malwarescore=0 phishscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607310063
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260731_015206_786912_D31F5B4D 
X-CRM114-Status: UNSURE (   9.72  )
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



On 7/30/2026 11:09 AM, Miaoqing Pan wrote:
> On WCN6750 platforms, QRTR SMD may not be available when ath11k starts
> during boot. If QMI messages never arrive, WLAN initialization can stall,
> leaving firmware running but no wireless interface created.
> 
> It also hardens the cleanup path to avoid crashes when deinitializing
> partially initialized devices after QMI setup failures.
> 
> ---
> Miaoqing Pan (3):
>   wifi: ath11k: fix sporadic WLAN initialization failures
>   wifi: ath11k: fix NULL dereference in ahb remove when QMI init
>     incomplete
>   wifi: ath11k: unregister PM notifier on QMI init failure path
> 
>  drivers/net/wireless/ath/ath11k/Kconfig | 3 +++
>  drivers/net/wireless/ath/ath11k/ahb.c   | 8 ++++++--
>  2 files changed, 9 insertions(+), 2 deletions(-)
> 
> 
> base-commit: 6776197cc88d0d397084bc47bca7e983017cecc2

Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>


