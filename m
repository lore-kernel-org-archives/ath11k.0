Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A7E1606A884
	for <ath11k@archiver.kernel.org>; Mon, 16 Nov 2026 15:00:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=LS6wK1Fs;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ChRX1BFy;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FLH7VPPQ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=RXX9heQMcXNO+PaZ4fu18kUBd3r5eQ/qywO4uLhdcVk=; b=LS6wK1Fsb7dhgT
	tj2BpjTTz3HobyHF5MC3u+c8thYIjDdUtDnAKH24uRtv6JcfrXYqSTrQG8bv7d1dVmiLXejHFenXj
	7YqmKwC7We0r/qh6TiUR+1XKrXVSCrojwt6mBk5tc2DoIgzcC9Loh+nYIa03MCsiBlJuSXTyqJ/rW
	d1/pbgGQ2XiKG6+3/roMh3dkyByK1Sb8rjvgB6K+to9v9r2TvbWSJCFaPHgzL5CL6GN0aVNWqMVTa
	YsI3w+ggGHwOb4FRCYKEcecJi4h/K1oW/MF7cCmw32ZC9lQeASadQERf/F1n08jIMoUFfOLfbdhP9
	ncCu67SeqJR29b+h0Z3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSyBp-00000002y6g-2dv8;
	Mon, 16 Nov 2026 15:00:13 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSyBm-00000002y4Q-3v3Q
	for ath11k@lists.infradead.org;
	Mon, 16 Nov 2026 15:00:12 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AGDrQrW1934752
	for <ath11k@lists.infradead.org>; Mon, 16 Nov 2026 15:00:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RXX9heQMcXNO+PaZ4fu18kUBd3r5eQ/qywO4uLhdcVk=; b=ChRX1BFy2FuBC2wv
	GnoWRv2rK6t1JIBQ8R0clsS10kzhUo+TE2gSMk/o/sRjDxK3yKEyVYWMOyXAFS5W
	ER9y2zR9uMtHZPkuJNQYa2HczEapMFKGMbg+WrOX6y5jY/apt51240IWCf7tSC5v
	c6WZcr1XILQTo8EHCmEQ5nw3ojCxS2YiIcGOux+OF8nr6Z7MlNufWgzYoOu9y7kD
	FdnG2BuKmXMpc4kzCQpMn4O8YHbM2wpzP6AZ4tX7eHHFpNZexT6qFERV3dwCH1FY
	dmRM0d5lnFRr+iFbKZfp5LRkyv5YSz/G1m1Kd2kzk5QVQRGOVz34MQnzob8e9iNW
	q4SCyA==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hyrmc2nph-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Mon, 16 Nov 2026 15:00:09 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-3724667bc16so2329271eec.1
        for <ath11k@lists.infradead.org>; Mon, 16 Nov 2026 07:00:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794841209; x=1795446009; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=RXX9heQMcXNO+PaZ4fu18kUBd3r5eQ/qywO4uLhdcVk=;
        b=FLH7VPPQoss9+Jwpqmn+573kB+kvPc+rflsLXzgxqteZqttjqOeyAyJ/dsKMt1ivUP
         gPtBf1hBcCcF7fYP+xl5ldjnu8WgEyT2efzQbBt7dtEWHZQDHjlqSF3dvFiw/YQ7DESh
         VaRb3U32g+KYEYpKNHAxtqfeWYLffm87za3xwKtOg1Q9nPH+eecd6/kNaekrsBCz8jhY
         zSYx9YRnFwIolZuQ/Jwjk5X6RAMEOhFD2q+blzE+6V9jdku1UlK5hDTGBUCiOc/yJfE6
         pP6UOu1mHxeZkRmcDeMgmVqvmNaYv/RdHG98qIeNyfcjVTzf1unTojU+cPPTo3kKchTo
         MhZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794841209; x=1795446009;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RXX9heQMcXNO+PaZ4fu18kUBd3r5eQ/qywO4uLhdcVk=;
        b=TkwG/9TsYwBvWIbGh2+ks8Vvgi9QNiYpHXQp4WvgJrwAdtLjFMn4G9+hBw86rFEPvw
         v4ZVgTbxE3oApdCNz4BMEF0jXe4uurDDSse9ofaeVqCVDiVVSYdRVb144bAPDHAonLry
         dLsAE7kVR6SrN2C57YwNp0thxhfhhi/woOUDY49c9aNCH8gsXBWRgzKSrXtoTNyeqlax
         UFbn3fl7dJHr5o2AKLQTs8BlKEQnXG1GufOt/yDPTuan+9o56rf+wROO5qXcOfSGidzT
         9QRzTGv6/ZFlVckzJYT9LI4mtLk48kNcPi7VbCqJx0pCzip7ibnU2FWq5HI8fwyJMjAX
         sgPQ==
X-Forwarded-Encrypted: i=1; AL+hErGRJGP1jJFN3tgCg2pTzLDtyVpN6Yfh7l/RuXpdXRIoqulDxhRPZ9MCIz3UHnWv6A6SUZAiYzE=@lists.infradead.org
X-Gm-Message-State: APuU4Z/APAlPEx51882xv9xQACbzQKt7xTl5hLpzjo524yRIyYiA3+oD
	pwfQ9AvBs7Shk50h1IqfMVWPVo4Tgx/59q3+kaKtZH8l8wF6Ll4lRkCP5MwLYtjwF+SAGzbm6ot
	z9hLvY9zTeL5zp378Dmm3S9xox0RKId/q3WVmW+bbDLxbAFMkR1HRWxIctu7rF6EG
X-Gm-Gg: AYBFou13TpaVSqgWTCJvtIlurHd3alxJXjDN+TvA0vnw7FLKkOESqPgeF0xJFtMfz8v
	d3st2HzOLTLXTM3H64k6NPnNHUGWkPKDuEmOKWLraPpzTlRsETW6ESSebQxPy7lkZUipV2o9Sj8
	q3NvBFUIkLtNm1R4BYWKW4WxmEu045JPPv0I8k3luk3YIPyxN9JtOs4ZWts2gYPZhRnlLNy3qb8
	4hyQXo5pOl46eczSVio2VL+cMkAMSUvpXO0QROcYJa1iQq+dwz3UtGIeqylO2OsnRosg5FXUUOf
	bTpuLHOYsNJ/ElgsDlu27QeVAzGjK6o6V2cNwlgYIMws5ntFWJdHbTctPusgRyZZ3+rRqLtA/Qt
	RJOFzvFg2TIcmKznmQtRMBA3yAkwI5IfoSwWoR8TiSQxEEE5AkOfIUbE2qbLDxTI2b1FdkhhsRj
	L0H8OWNVAfGckHNdp1xFJIDLTfjfui
X-Received: by 2002:a05:7301:4718:b0:375:85ac:d14f with SMTP id 5a478bee46e88-377e10172d1mr11725385eec.14.1794841208822;
        Mon, 16 Nov 2026 07:00:08 -0800 (PST)
X-Received: by 2002:a05:7301:4718:b0:375:85ac:d14f with SMTP id 5a478bee46e88-377e10172d1mr11725347eec.14.1794841208111;
        Mon, 16 Nov 2026 07:00:08 -0800 (PST)
Received: from [192.168.1.20] (39.sub-97-215-59.myvzw.com. [97.215.59.39])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379553316fdsm35495661eec.5.2026.11.16.07.00.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Nov 2026 07:00:07 -0800 (PST)
Message-ID: <f7ecb009-4c95-4ef2-b569-3b2069298c41@oss.qualcomm.com>
Date: Mon, 16 Nov 2026 07:00:06 -0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath11k: read a station's TX rate under base_lock
To: Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
        christophergriffin05@gmail.com, Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20261114-ath11k-sta-txrate-lock-v1-1-8331a03b1000@gmail.com>
 <a346e622-8fe9-4912-9ded-b531b1bdc82e@oss.qualcomm.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <a346e622-8fe9-4912-9ded-b531b1bdc82e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDA1OSBTYWx0ZWRfX/0TuqRY3m2ND
 iSyEnatAJVzCZiPSEjNIzAdIDz+7QINk5mNHm0b0+hO4sngsgcI1ML/RIO+9sqTK1PK2ohFi5v2
 Gs3CQ9ptWBPRUTcq5XwyCJleyrABqbE=
X-Authority-Analysis: v=2.4 cv=C9N8WgP+ c=1 sm=1 tr=0 ts=6afb1a79 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=7UwXyAtrHAWG9Tdc5CO1EQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=pGLkceISAAAA:8 a=UiHtVcSbJgHVZnjgSQMA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-ORIG-GUID: lIpbj1xAN0Ovtf3wXaNLQ5nwhBok4T4g
X-Proofpoint-GUID: lIpbj1xAN0Ovtf3wXaNLQ5nwhBok4T4g
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDA1OSBTYWx0ZWRfX9SEAXTODLE9u
 0MXaaEpiqqYXj4v4jNTCAD4W8+vqDyqrRC7Neohgo0NhUKInvAk7LiSsOSmok/UFnnXwbmJrcVh
 KFVvBt+dLmSSlePImoiwIAK4Sgp+H9iQ4yz5rQYq7w/Wg/K+gtfHf9w4tGsp+fhsvmaKTfKRWaq
 /EOYh7Vo07TVANYeXabDTia69u1e4oRmimlOKCegSyMdj8f1Q7ICamcSmPY5ajsJ234nDbyaifF
 1Bip/0+Tid9FRukLwbPDtPOP3/pWD29nFFM8SeHBzdNT+WDWRNrPS79L1HdEFd60OgaV/6dm+Qn
 RDjfQk4yZx1+CWyj7DqZjeBEAEOp4y5TUQxnKgP2CwVEqFUKZQpJtOAQaUwWYWxabFq4Aamu6BQ
 +350vzp90tDY1PfAacd3S6SDtSNfZnyfIaGo4ltRx3fiTVj3gwk6G4xE6+GGCTBRWRjy2MmauN9
 IV0OVtbLbRWQBpTtZOg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_04,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 suspectscore=0 lowpriorityscore=0
 clxscore=1015 spamscore=0 adultscore=0 bulkscore=0 phishscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611160059
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_070011_002867_AAE55E2F 
X-CRM114-Status: GOOD (  18.20  )
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

On 11/15/2026 7:03 PM, Baochen Qiang wrote:
> 
> 
> On 11/14/2026 10:34 PM, Christopher Griffin via B4 Relay wrote:
>> From: Christopher Griffin <christophergriffin05@gmail.com>
>>
>> ath11k_update_per_peer_tx_stats() and ath11k_dp_tx_update_txcompl()
>> rewrite arsta->txrate under ab->base_lock: they clear it, then fill in
>> its fields one by one. ath11k_mac_op_sta_statistics() copies it into the
>> station info without that lock, so a station dump that runs while a TX
>> status updates the rate can copy the HE flag with an nss of 0, and
>> cfg80211 warns:
>>
>>   WARNING: CPU: 3 PID: 30429 at net/wireless/util.c:1581 ieee80211_get_vht_max_nss+0x474/0x868 [cfg80211]
>>   Call trace:
>>    ieee80211_get_vht_max_nss+0x474/0x868 [cfg80211] (P)
>>    cfg80211_calculate_bitrate+0x1e0/0x4f4 [cfg80211]
>>    nl80211_put_sta_rate+0x50/0x1230 [cfg80211]
>>    nl80211_put_sta_rate+0xa30/0x1230 [cfg80211]
>>    nl80211_dump_station+0x4b8/0x7e0 [cfg80211]
>>
>> (the line is the nss check in the inlined
>> cfg80211_calculate_bitrate_he()). It was seen once in about a day on an
>> IPQ8074 AP whose stations are dumped periodically by a monitoring agent.
>>
>> Copy the rate under base_lock and report from the copy, as ath12k reads
>> its peer rate info under its DP lock.
>>
>> The change and this message were written with Claude, an AI coding
>> assistant.
>>
>> Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.9.0.1-02146-QCAHKSWPL_SILICONZ-1
>> Tested-on: QCN9074 hw1.0 PCI WLAN.HK.2.5.r4-00683-QCAHKSWPL_SILICONZ-1
>> Tested-on: IPQ6018 hw1.0 AHB WLAN.HK.2.5.0.1-03982-QCAHKSWPL_SILICONZ-3
>>
>> Fixes: d5c65159f289 ("ath11k: driver for Qualcomm IEEE 802.11ax devices")
>> Signed-off-by: Christopher Griffin <christophergriffin05@gmail.com>
>> ---
>> Found on an Arista C-360 (IPQ8074 + QCN9074) running OpenWrt, from a
>> warning in its kernel log; the cause was found by reading the code.
>> ath12k already reads its peer rate info under its DP lock.
>> ---
>>  drivers/net/wireless/ath/ath11k/mac.c | 26 ++++++++++++++++----------
>>  1 file changed, 16 insertions(+), 10 deletions(-)
>>
>> diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
>> index 1a237adaa37d1..d76eeb1ca0019 100644
>> --- a/drivers/net/wireless/ath/ath11k/mac.c
>> +++ b/drivers/net/wireless/ath/ath11k/mac.c
>> @@ -9425,6 +9425,7 @@ static void ath11k_mac_op_sta_statistics(struct ieee80211_hw *hw,
>>  {
>>  	struct ath11k_sta *arsta = ath11k_sta_to_arsta(sta);
>>  	struct ath11k *ar = arsta->arvif->ar;
>> +	struct rate_info txrate;
>>  	s8 signal;
>>  	bool db2dbm = test_bit(WMI_TLV_SERVICE_HW_DB2DBM_CONVERSION_SUPPORT,
>>  			       ar->ab->wmi_ab.svc_map);
>> @@ -9435,18 +9436,23 @@ static void ath11k_mac_op_sta_statistics(struct ieee80211_hw *hw,
>>  	sinfo->tx_duration = arsta->tx_duration;
> 
> arsta->rx_duration and arsta->tx_duration are u64 and are also only updated under
> ab->base_lock, so on 32-bit they can tear the same way. Since the lock is taken here
> anyway, moving those two reads into the same critical section would cost nothing, and is what
> ath12k_mac_op_link_sta_statistics() does under dp_lock.
> 
> Not a blocker, fine to leave it for a separate patch.

I'll incorporate this suggestion into the patch in my pending branch


