Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 703B9C5AC7A
	for <ath11k@archiver.kernel.org>; Fri,  7 Aug 2026 15:39:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FCRWjh1yZDl8I8dIWG38FEvpFTulB4/sCRQjieQKxAk=; b=jCjpDZjU5MhCNxa/FDW5FKnCmA
	UoCfI+KI/5RxkaZ11ropamPqyMXopcSP/0BM8XbJHpZKlCWhYolkTRDlpKpnMwq2lsraKPImD7prK
	9WfgsYwP8bN3SDU81iF+gswAYb0F88hHv1txpKDuo206cidaxkppcHdl9VHmIxnmCy5g4bHf6omN6
	c+sSoSgrcaDuWyTj3hlR3b5D7uXqI9X0QmUR/flpvDywwBIcAOoNJWc916ZXk2C0rwiASQ6zx32dA
	lsZv7BcYDHP6q0MKICcWZggHdgY10sI2cqbDXMEh25d9zW0xCiVtI1KMwBHplC8hssWPoXJZmUiFO
	vyukll4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsMfa-00000008MKn-4Byv;
	Fri, 07 Aug 2026 15:39:39 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsMfY-00000008MJB-3hLH
	for ath11k@lists.infradead.org;
	Fri, 07 Aug 2026 15:39:38 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 677FRZ2A1911833
	for <ath11k@lists.infradead.org>; Fri, 7 Aug 2026 15:39:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FCRWjh1yZDl8I8dIWG38FEvpFTulB4/sCRQjieQKxAk=; b=bAK2Qd4DlymE7U38
	WUHXfSxWgwQt9R3qkCujwKqXKkIONZwYaSmuoxGrEeCpK4SWAdpPvKtBbZuAXF4O
	sp4hL2gJx77QXsc++9UIAHuZ7zwur4Q+uzYOhhPO3StaCdWeJIZmQab7gzhvJIue
	sI5qn5cjbH0Pdww8G5RtPulpxx8/rU8nclmxGjYawXAwHs34JXywmE/eFx1z5dDQ
	+t7+F4y+M3pRQRo0/O5Alfde2XEA03TZTBt7mj5P3D/efQeeBo7W9sYhxwDBZgKq
	7wRvkaIZN8LgNG2ADmTf0HWdmcc8A7OAxrq4Y47uSalb1KgPKXXB0AoGJfYxbNKx
	1L9/tQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fwcjb1f8e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Fri, 07 Aug 2026 15:39:36 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38f0fe57470so2415580a91.0
        for <ath11k@lists.infradead.org>; Fri, 07 Aug 2026 08:39:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786117176; x=1786721976; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=FCRWjh1yZDl8I8dIWG38FEvpFTulB4/sCRQjieQKxAk=;
        b=OetIAi6rFSpKBzdvknX6oNgeKwL2W2eYmz3JOj0vzoeypa3MGNcSaBi6nBMgUtLpyw
         VMzJTePcwTAgoSoYgYGm4sXDk1HNKlNw/CRiJ7SWcgJL9926sBdwh7WSVQQv5a4PiwiK
         qWBar9IESiHygUMqFhce+DOWTXVIPXalLQC6thEJDrvtIlgduE1SJrzrLEJ4trOxvtLG
         WKd7IkJRyPs/lppKBktopsJOzK6WbzDyhhA6jH8jdBd9WrfBYhJgKyV50FKfcvuiS8/c
         anG/BWiLQB273Mvl/u//XcLMZ0UUb18w2KyJmXIzkqGNTLcaikKTHgZGM+d5o8+Zt/AV
         BmHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786117176; x=1786721976;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FCRWjh1yZDl8I8dIWG38FEvpFTulB4/sCRQjieQKxAk=;
        b=BnmpUq5Z+UU2vfi/bsSsrKJnImvAOv17VGCJL0TEn6X/eJfwCYikC0au9WbMu6JoNG
         dXjT/4o0iOgkmSOyRZFUEW/qYGbqt1zb6UWweleqyJjY6brjuOG/wUdyO46dINc52DJK
         xHyh9m2sYT55K63sJO6AOTSNTPyevr2PiB/Sbvna+sIhg+Aa54reLehLaBA8QFQ8j0HY
         CF2enyHpP1VBgcQFtD01yzo7AcD5Nrclh8bXc70tvLz01F36nJiaDB5bmPo28WJ1mmGE
         J2YZZbNOCto25J/aJ2YiVngLUIs8F9zpMZUajAI1dV3IE8eCQ4yvPour0czgvFI/LYTx
         n7Mg==
X-Forwarded-Encrypted: i=1; AHgh+RrPpNh7oWWuEfX79Q3+axEEcMWnULQonp2jsgVhDKFtlFREj5dSeJ1oHyVRl61zm7gS8wczkDY=@lists.infradead.org
X-Gm-Message-State: AOJu0YwRsvll9vIGywu53L0KdJ23LZeYCF/pgMwqNwlr3tIEphNWLXbu
	8Y3puEFAaDYjSZ3MADIWgibhInv5SXkZdgOqEYHMwOaenpwi3ZqHI+bm7n+0R/onH9UPTDQcp+N
	d232tADDwauxrZMyAnlVJ83CB8QsT/mtrRwDpkkwkC3IMwMHUBWLwJrpV/5bWRhB+
X-Gm-Gg: AR+sD12xpDziw45rYBxOPaDWCYm17w5gK52V9ibCS029odl5VAI4cQmKi3SjzFx0WV+
	lsUYI33s1lD8gcxtySgfLFRa8FiZzUUI4Sk35xGUapM5ABKDq28stPkM+WSXFRCkwLyT53+TikU
	jK3iz5UUToLkrVP7c9RrAuaJ7Cn6Sidq7H7EI+dOVpW11Jqy1JQ262eBpDWgw9Q/Irr70L7ha/X
	4NuEQnvfi4XwOBvus/7dNJSoGlwFUAFnxYZqtMRhC3z04Hxa/rIwL5oPFCGOzhGT7Ti5I4Q3l9N
	x1UD8Th0b0skrr1hnl+uQlKE1LGWzDslk2dQUb+evdmxOpCT+qu0hrOjJ3E91NU74CRJ/xDFgGW
	NGUXALGgUCTh5uC1X7w/yf1nrSJxxjKfqtWdr+Cf+zrw7q3JU3bupqINXnnNK
X-Received: by 2002:a17:90b:4c89:b0:385:3ab:fecb with SMTP id 98e67ed59e1d1-3928221e3d3mr341647a91.4.1786117175559;
        Fri, 07 Aug 2026 08:39:35 -0700 (PDT)
X-Received: by 2002:a17:90b:4c89:b0:385:3ab:fecb with SMTP id 98e67ed59e1d1-3928221e3d3mr341595a91.4.1786117174898;
        Fri, 07 Aug 2026 08:39:34 -0700 (PDT)
Received: from [192.168.1.20] (103.sub-97-215-187.myvzw.com. [97.215.187.103])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-315bebde353sm9696021eec.23.2026.08.07.08.39.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Aug 2026 08:39:34 -0700 (PDT)
Message-ID: <8a152b94-d6c4-4d51-8362-1047ef311c70@oss.qualcomm.com>
Date: Fri, 7 Aug 2026 08:39:32 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath11k: run ahb shutdown() teardown only on WCN6750
To: =?UTF-8?Q?Andr=C3=A9_Valentin?= <avalentin@marcant.net>,
        Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        Kalle Valo <kvalo@kernel.org>, stable@vger.kernel.org,
        Manikanta Pubbisetty <manikanta.pubbisetty@oss.qualcomm.com>
References: <20260807094858.1548216-1-avalentin@marcant.net>
 <79444a54-8500-43df-b0c6-f6a98c230dea@oss.qualcomm.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <79444a54-8500-43df-b0c6-f6a98c230dea@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA3MDEyMiBTYWx0ZWRfX5SFGpSkPgD6m
 ymwiyZ/qxBJibuhgZhNT8p9TWEgkz8KBpLYoT3B2pYYekpiNPIDSoef1k0GNh5lllFXp9hBqlg9
 5hBXMY0mkg25E7t7kprzy6TNbsqyrzjFRHqYySfFtsTwL3RC4MHS2g2octXeRMPvGKmP8kHOvsE
 tAFH9U5TPwg6R24itW6Go7n5mofPfGtcnHFvyZaUWcnRDWXDgGurQEtJLh6UZ8Wjys4zTwlUbxW
 Kc5g1PXIhtpUkvxICGc80zqKUNzWZxjvfPmjQ/zFLKVIfpiMqoVw7vAyk+RlSI4EswFVJS1adf+
 Ykrvl+QE2CfbhEfPhp+PWq9feglFbu8vZd75F7wwspizy+BzTOckV8Z6i4/CdnGyr/DCZsjVbzv
 qF61HUdU3hjpzqLUBDvBbl8XqN40NdgcRzT+8hi2NOIGr9oAq+IJlNUGGdrUPV8fVFgOnrFflMi
 wjKE1qTlJTPt1847zsw==
X-Authority-Analysis: v=2.4 cv=QsBuG1yd c=1 sm=1 tr=0 ts=6a75fc38 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=UaEkX0D7FlC0tWE/LoNF7Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=7bAZdoCWAAAA:8 a=EUspDBNiAAAA:8
 a=sz1l3bY0xy_xST6I20UA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22 a=TjNXssC_j7lpFel5tvFf:22 a=7DsIbQzYVz3x35o7bboS:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA3MDEyMiBTYWx0ZWRfXyU44zQL9TXxd
 d5JxyTqH5WTlIssd5SJLm2J4BCRiEss53Y1Vk5p1ti6L4i2j3jNzpi9cU/ZKwN08aS/1FkuSkM0
 0wn+ph3K0Mjl1/cOTkHpTYaxgaf0wVU=
X-Proofpoint-ORIG-GUID: 9RZ08V8egiwM70kjf2UCxY-ApZL7XmlA
X-Proofpoint-GUID: 9RZ08V8egiwM70kjf2UCxY-ApZL7XmlA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-07_02,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 malwarescore=0 impostorscore=0 clxscore=1015
 priorityscore=1501 adultscore=0 phishscore=0 suspectscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608070122
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260807_083936_947195_1412641F 
X-CRM114-Status: GOOD (  22.03  )
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

On 8/7/2026 8:34 AM, Jeff Johnson wrote:
> On 8/7/2026 2:48 AM, André Valentin wrote:
>> The AHB shutdown() callback was introduced solely for WCN6750, which has
>> to stop DMA before the SMMU is torn down at system reboot/shutdown. It
>> was registered unconditionally in the shared ath11k_ahb_driver, so it also
>> runs on the IPQ AHB targets (IPQ8074/IPQ6018/IPQ5018), which never had a
>> shutdown() handler before and have no such SMMU requirement.
>>
>> On IPQ6018 the shutdown teardown stops the WCSS Q6 remote processor
>> firmware. Stopping the Q6 firmware leaves shared WCSS state such that the
>> boot ROM (SBL1) hangs during DDR training on the following warm reset;
>> only a cold (power-on) reset recovers. A plain reboot therefore never
>> comes back and needs a physical power cycle.
>>
>> This was pinned by bisecting the teardown at reboot: skipping
>> ath11k_qmi_firmware_stop() (i.e. not stopping the Q6) is what lets the
>> warm reset train DDR and boot normally, whereas none of the q6v5 power,
>> reset or clock steps reproduce it on their own.
>>
>> Restrict the shutdown() teardown to WCN6750, restoring the pre-regression
>> behaviour for the IPQ AHB targets. On reboot/shutdown the whole SoC is
>> reset by the boot chain, which re-initializes the WCSS from scratch, so no
>> teardown is needed there. Module removal (rmmod / remove()) is unchanged.
>>
>> Verified on a MikroTik Chateau 5G R17 ax (IPQ6018): before, a plain reboot
>> froze in SBL1 at "sbl1_ddr_set_params"; after, SBL1 reaches "SBL1, End",
>> trains DDR and boots the kernel across repeated reboots.
>>
>> Fixes: ac41c2b642b1 ("wifi: ath11k: Register shutdown handler for WCN6750")
>> Cc: stable@vger.kernel.org
>> Cc: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
>> Signed-off-by: André Valentin <avalentin@marcant.net>
>> ---
>>  drivers/net/wireless/ath/ath11k/ahb.c | 12 ++++++++++++
>>  1 file changed, 12 insertions(+)
>>
>> diff --git a/drivers/net/wireless/ath/ath11k/ahb.c b/drivers/net/wireless/ath/ath11k/ahb.c
>> index 1e1dea4..749d8bf 100644
>> --- a/drivers/net/wireless/ath/ath11k/ahb.c
>> +++ b/drivers/net/wireless/ath/ath11k/ahb.c
>> @@ -1288,6 +1288,18 @@ static void ath11k_ahb_shutdown(struct platform_device *pdev)
>>  	 * remove() is invoked during rmmod & shutdown() during
>>  	 * system reboot/shutdown.
>>  	 */
>> +
>> +	/* The shutdown() callback was added for WCN6750, which has to stop DMA
>> +	 * before the SMMU is torn down. The other AHB targets (IPQ8074/IPQ6018/
>> +	 * IPQ5018) have no such requirement, and running the teardown here stops
>> +	 * the WCSS Q6 firmware, which leaves shared state that hangs the boot ROM
>> +	 * (SBL1) during DDR training on the following warm reset -- only a cold
>> +	 * (power-on) reset recovers. Skip it on those targets; the SoC reset
>> +	 * re-initializes the WCSS from scratch.
>> +	 */
>> +	if (ab->hw_rev != ATH11K_HW_WCN6750_HW10)
>> +		return;
> 
> this is not the correct approach per the driver architecture.
> all hardware-specific operations should be driven via the hw_params structure.
> 
> /jeff

+ Mani's current e-mail address @oss.qualcomm.com

