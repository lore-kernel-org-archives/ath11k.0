Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF1A3C87FCB
	for <ath11k@archiver.kernel.org>; Tue,  5 Aug 2025 17:13:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rK809CsINwiAbdfXrKXaasDEAsLHyN4a2HhjdlaGhtQ=; b=qSV60KDPsBMG5lSAENebv3jZgy
	yvcopMowjqHU8+MGt6LAX7NM8tqvkKYToqluJKVpaXhfEB+YSXqdLNDdpTwVFBsaUkLRtKDEwGsKc
	w1DyI0x7wtUYDWXJ4izmTpk/GhoKimasGxS2SpvLFYZOKsrQp4Qk4Q3T/J27ksnqHhZ3I2v2QFlNc
	ONjfYVvoWvGh4MEAySOP6dxPnWSRJ6jYOXXUYPnjICgV7rs+Li+XVCAcvakD100w+qKt55xbJkLSq
	XxWiLcqga0DuXbPICTo/DWizWRtR/kveUoZNzq2gil1L0FjpiIzQljZ/VzcOaaRkM+9ERsb4iGioa
	fc0nMkRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujLEB-0000000DOgw-0r51;
	Tue, 05 Aug 2025 17:13:31 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujKca-0000000DJJk-2Qh3
	for ath11k@lists.infradead.org;
	Tue, 05 Aug 2025 16:34:42 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 575AV8XK011183
	for <ath11k@lists.infradead.org>; Tue, 5 Aug 2025 16:34:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rK809CsINwiAbdfXrKXaasDEAsLHyN4a2HhjdlaGhtQ=; b=lRb4aBz8TIoiImu3
	LTsEHRAuA7W57ofSITJB7zAiBipLzNTHaHyxfYcqt5TbfJzsior2HlNxgXhIF5Ny
	sa7IAUOXp0rr0O6ug2OHSvFzzIBWO938c+3Znvox8GrmXrQ/GxzoS9rC5pElf2ZR
	VNrNO2b1OsPsbsnxxLoX3QhsGWMNqc+/UqwkrKwxPkYPDa+u1Bg6Jru9FqJfeKhd
	zazyGzQpUzovL5C+oG7Mi6ay0LxBqu15lVGrKB2rgzUd39Hw7OajwrHrEnvIIg+J
	D/STL8jj++4jTGVtiYAmB0UfY1aYtmhmk6Xg/jPgrnscQ3qiN92tpiUEJogmu2mS
	yWDjyw==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48avvuc5hw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Tue, 05 Aug 2025 16:34:38 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-75ab147e0a3so8918440b3a.3
        for <ath11k@lists.infradead.org>; Tue, 05 Aug 2025 09:34:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754411677; x=1755016477;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rK809CsINwiAbdfXrKXaasDEAsLHyN4a2HhjdlaGhtQ=;
        b=FG/R8rb6ZWj8c3hMo7lcbhtde1yhENRBVZncCtuY7w3cZ6SbJQmmXhEhEKgqUiCllw
         Xm7UpL2TkxPtUiQLxAabnQy6tfMPwwgvjhWRDpmdcjGLvZfEIb+f2WCDFurM/oVt8qzx
         zDwZ2BSx5T3CQi5uRJXpeb6pEjXNd13T68ej+j3KGBtqJysgeCBZZAd6lb/ev1W2swG0
         nYdd6uDsVuLCiONEE8mTT1esOZpClUwbbfSZz4S+5btgPjAggnImObgJrYbDeSLJa7xG
         Jl5ArNWCx12/LQfIdUv7r6Bnlygv7pHMDRtmvg59nWfHIL4L/vxeaF3ODl4QvgERZMae
         V7bg==
X-Forwarded-Encrypted: i=1; AJvYcCX1JA3/mkqACM9ndmeF1/RGBPW088eaK+9+CwRGbPPfytDGZ3m+t6aqGQHOc9jeHUKeOw5g2+s=@lists.infradead.org
X-Gm-Message-State: AOJu0YyhIpzpr/aAK2qRy9pfJwssB7sK4XWMabw+/L3otfNKaF/+p2rS
	SjbJlSCPOvSC9sgFoVIgb/PWnUSJyeE9f6Tt8qaaRBJjqD/GTu7vOXUlmlNSRT56xTZ2ZX9j0we
	95BjEIgGWPMC3IVgVZKeD0+fKxY0sqHKZ7iKzBrBqQMmutq3ynry1Hte0G2JhmPCcM8yaVi94
X-Gm-Gg: ASbGncuEQvfEhYQD2QzQ/5F5ltFqErbTcqRiRU9ngr8wiX3YIQwS8wsxtCLyN8UyNWP
	ApRKCZq7kWJsW2VMJkNo+USl9vLSoyTD46M/CiwhW0cTqHWM0qu89z/lAt75zsghEDreZOFduTa
	jfkGI+GeNqtjceKnEAAheykqdxmZW3QrBo5f76XWU27qp9+uoQoDUOeqKkMZtzQSHI0rPnr/5Hw
	w7BW6BiQ1rFze3Oj125gvIi3HnlIzDVS+eWW6aYbw8yxceDDqsfQbkLW1nxgYOoCIvksurnavRZ
	KFJyEsY486SUFgNPpNZWc9g3e5LW8t3XgxqsbmD+Q1hjfknn4q962ay1FkjcQcAww84XhHLn86f
	0JDuCrr1p
X-Received: by 2002:a05:6a00:1947:b0:76b:d8c8:2533 with SMTP id d2e1a72fcca58-76bec5024ccmr19369626b3a.24.1754411676725;
        Tue, 05 Aug 2025 09:34:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEkKGNJHL85ysPluO/8DBmKKLFmp6FvakvbJphzQShrBKd7IzG9euyUi9HyeRqUCfpbTN+9Lw==
X-Received: by 2002:a05:6a00:1947:b0:76b:d8c8:2533 with SMTP id d2e1a72fcca58-76bec5024ccmr19369581b3a.24.1754411676163;
        Tue, 05 Aug 2025 09:34:36 -0700 (PDT)
Received: from [192.168.11.102] ([124.123.81.173])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76bcce8fa33sm13471159b3a.43.2025.08.05.09.34.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Aug 2025 09:34:35 -0700 (PDT)
Message-ID: <e83dff3a-cf4b-4379-b19d-4642fd2c4eaa@oss.qualcomm.com>
Date: Tue, 5 Aug 2025 22:04:33 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next v3] wifi: ath11k: fix group data packet drops
 during rekey
To: Raja Mani <quic_rmani@quicinc.com>, ath11k@lists.infradead.org
References: <20250804075344.3494691-1-rameshkumar.sundaram@oss.qualcomm.com>
 <aa09b524-a167-4d4d-8770-c3be019b13a1@oss.qualcomm.com>
 <efa2eb35-0058-4337-99c5-bd4489248360@quicinc.com>
Content-Language: en-US
From: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
In-Reply-To: <efa2eb35-0058-4337-99c5-bd4489248360@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA1MDExNCBTYWx0ZWRfXxQiRAPcAoRCS
 rFnXcyM3M2rjlU7ki9flCX0V+YTC+awcHiF4OgJm6R0QhGoj3X+1tWdIbsfuijXcIO1LubdX9Hn
 jIyDwgTWCz0JpM+2PiTnThjgwYXaxOUqWe/pAoY2NkPV+yVdfDF31vaA+/D2cGWJTaWfmBFq88z
 vLCHpjXdonEGU8YK4/2fCq2zbIwh5RG5CwI7JwTZ0FXuGZn0aAybTjnIz9j5x5667VWIasmpJ+Z
 0uLGaCJdGiYnauiyw68I/0qzMQbXoifdesfVqxbQhI8UwdsZMlPIwx0tZ7YUrr3N5NjoaGCDY/O
 ZWhpmrDKMqr7Nw/r3EmRXoKPT/bWelpzs1ytCTWkZTafwrdMyJdLcQEgrRINr7m4hkVPE7a4lEF
 fmpDMXOMN5yp+YLqLi7e7gxR1p0Piw7XVTEACRopc4eVZBch6ptZ/vWmLerkrMStU8Uv/FcP
X-Proofpoint-GUID: Ru2z6oZnRXgnyX3o793aVx3mcMmWtUEK
X-Authority-Analysis: v=2.4 cv=OYKYDgTY c=1 sm=1 tr=0 ts=6892329e cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=R7zuFBDiW8lgADV909h7jA==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=kerEwqhhP0ind554lpIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: Ru2z6oZnRXgnyX3o793aVx3mcMmWtUEK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-05_04,2025-08-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 impostorscore=0 phishscore=0 spamscore=0
 priorityscore=1501 mlxlogscore=999 malwarescore=0 adultscore=0 suspectscore=0
 clxscore=1015 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2508050114
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250805_093440_750840_F13B8862 
X-CRM114-Status: GOOD (  37.38  )
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



On 8/5/2025 2:55 PM, Raja Mani wrote:
> 
>> During GTK rekey, mac80211 issues a clear key (if the old key exists)
>> followed by an install key operation in the same context. This causes
>> ath11k to send two WMI commands in quick succession: one to clear the
>> old key and another to install the new key in the same slot.
>>
>> Under certain conditions—especially under high load or time sensitive
>> scenarios, firmware may process these commands asynchronously in a way
>> that firmware assumes the key is cleared whereas hardware has a valid 
>> key.
> 
> IIUC, The firmware cleared the old key in the hardware but it missed
> to install new key in the problematic condition.
> 
> The rest LGTM.
> 

Not exactly, Firmware has processed clear key and set key in right 
order, however the clear key call back from Hardware arrived much later 
(after the firmware had processed the set key request from host) and 
this clear key call back wiped out the latest key that was set in firmware.

But hardware will have a valid key as it had later processed the set key
request from firmware.

adding firmware analysis:
----

The race condition exists between Key clear CONNECTION BLOCK call back 
and next Key install WMI command causing this issue of no mcast frames OTA.

1. WMI Key clear command is received - initiates CONNECTION BLOCK for peer

2. WMI Key Install is received, sets Key into the HW and initiates 
CONNECTION BLOCK for peer

3. WMI key clear CONNECTION BLOCK callback is received from HW and this 
*clears the key* and initiates CONNECTION UNBLOCK for the peer

 >>>> this is where the problem of clearing the latest set key occurs

4. Key Install CONNECTION BLOCK callback is received from HW - this is 
supposed to update the mpduQ length on to the TQM, but due to this race 
condition, as the key install flags are cleared, this update fails and 
it enters the limbo state.


 >> the callbacks from HW seems to not handled properly for immediate
clear followed by set, so basically when set key call back is invoked 
the key doesn't exist at all in FW (as previous clear key call back had
cleared it unknowingly)


5. Finally the CONNECTION UNBLOCK schedule enables the peer.

Now the mpduQ is having higher MPDU length but the encryption is not 
enabled causing this GT MPDU flush.

----



>> This inconsistency between hardware and firmware leads to group addressed
>> packet drops. Only setting the same key again can restore a valid key in
>> firmware and allow packets to be transmitted.
>>
>> This issue remained latent because the host's clear key commands were
>> not effective in firmware until commit 436a4e886598 ("ath11k: clear the
>> keys properly via DISABLE_KEY"). That commit enabled the host to
>> explicitly clear group keys, which inadvertently exposed the race.
>>
>> To mitigate this, restrict group key clearing across all modes (AP, STA,
>> MESH). During rekey, the new key can simply be set on top of the previous
>> one, avoiding the need for a clear followed by a set.
>>
>> However, in AP mode specifically, permit group key clearing when no
>> stations are associated. This exception supports transitions from secure
>> modes (e.g., WPA2/WPA3) to open mode, during which all associated peers
>> are removed and the group key is cleared as part of the transition.
>>
>> Add a per-BSS station counter to track the presence of stations during
>> set key operations. Also add a reset_group_keys flag to track the key
>> re-installation state and avoid repeated installation of the same key
>> when the number of connected stations transitions to non-zero within a
>> rekey period.
>>
>> Additionally, for AP and Mesh modes, when the first station associates,
>> reinstall the same group key that was last set. This ensures that the
>> firmware recovers from any race that may have occurred during a previous
>> key clear when no stations were associated.
>>
>> This change ensures that key clearing is permitted only when no clients
>> are connected, avoiding packet loss while enabling dynamic security mode
>> transitions.
>>
>> Tested-on: QCN9074 hw1.0 PCI WLAN.HK.2.9.0.1-02146-QCAHKSWPL_SILICONZ-1
>> Tested-on: WCN6855 hw2.1 PCI WLAN.HSP.1.1-03125- 
>> QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.41
>>
>> Reported-by: Steffen Moser <lists@steffen-moser.de>
>> Closes: https://lore.kernel.org/linux-wireless/c6366409-9928-4dd7- 
>> bf7b- ba7fcf20eabf@steffen-moser.de
>> Fixes: 436a4e886598 ("ath11k: clear the keys properly via DISABLE_KEY")
>> Signed-off-by: Rameshkumar Sundaram 
>> <rameshkumar.sundaram@oss.qualcomm.com>
>> ---
>> v3:
>>    - Allowed clear key strictly only for AP mode
>>    - Rephrased the commit text and comment in ath11k_mac_op_set_key()
>>      to explain that the race occures rarely under heavy load and
>>      discrepancy of states between firmware and hardware
>>    - Added newline (\n) at the end of warn log in ath11k_set_group_keys()
>>    - Made addr varaible as const * in ath11k_set_group_keys()
>> v2:
>>    - Followed r-xmas style
>>    - Removed vdev_type check before calling ath11k_set_group_keys()
>>    - Removed lockdep assert in ath11k_set_group_keys()
>>    - Removed flags variable and passed WMI_KEY_GROUP in 
>> ath11k_set_group_keys()
>>    - Changed the if condition to have positive cases in 
>> ath11k_mac_op_set_key()
>>    - Added code comments in ath11k_mac_op_set_key() to explain how 
>> clear key and
>>      set key are issue back to back by mac80211 and added high level 
>> information
>>      about the firmware race.
>>    - Added comments in ath11k_mac_op_set_key() and 
>> ath11k_mac_station_add() to
>>      explain why a reinstall of same key is needed.
>> ---
>>   drivers/net/wireless/ath/ath11k/core.h |   2 +
>>   drivers/net/wireless/ath/ath11k/mac.c  | 111 +++++++++++++++++++++++--
>>   2 files changed, 104 insertions(+), 9 deletions(-)
>>
>> diff --git a/drivers/net/wireless/ath/ath11k/core.h b/drivers/net/ 
>> wireless/ath/ath11k/core.h
>> index 220d69a7a429..e8780b05ce11 100644
>> --- a/drivers/net/wireless/ath/ath11k/core.h
>> +++ b/drivers/net/wireless/ath/ath11k/core.h
>> @@ -411,6 +411,8 @@ struct ath11k_vif {
>>       bool do_not_send_tmpl;
>>       struct ath11k_arp_ns_offload arp_ns_offload;
>>       struct ath11k_rekey_data rekey_data;
>> +    u32 num_stations;
>> +    bool reinstall_group_keys;
>>        struct ath11k_reg_tpc_power_info reg_tpc_info;
>>   diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/ 
>> wireless/ath/ath11k/mac.c
>> index 1fadf5faafb8..106e2530b64e 100644
>> --- a/drivers/net/wireless/ath/ath11k/mac.c
>> +++ b/drivers/net/wireless/ath/ath11k/mac.c
>> @@ -4317,6 +4317,40 @@ static int ath11k_clear_peer_keys(struct 
>> ath11k_vif *arvif,
>>       return first_errno;
>>   }
>>   +static int ath11k_set_group_keys(struct ath11k_vif *arvif)
>> +{
>> +    struct ath11k *ar = arvif->ar;
>> +    struct ath11k_base *ab = ar->ab;
>> +    const u8 *addr = arvif->bssid;
>> +    int i, ret, first_errno = 0;
>> +    struct ath11k_peer *peer;
>> +
>> +    spin_lock_bh(&ab->base_lock);
>> +    peer = ath11k_peer_find(ab, arvif->vdev_id, addr);
>> +    spin_unlock_bh(&ab->base_lock);
>> +
>> +    if (!peer)
>> +        return -ENOENT;
>> +
>> +    for (i = 0; i < ARRAY_SIZE(peer->keys); i++) {
>> +        struct ieee80211_key_conf *key = peer->keys[i];
>> +
>> +        if (!key || (key->flags & IEEE80211_KEY_FLAG_PAIRWISE))
>> +            continue;
>> +
>> +        ret = ath11k_install_key(arvif, key, SET_KEY, addr,
>> +                     WMI_KEY_GROUP);
>> +        if (ret < 0 && first_errno == 0)
>> +            first_errno = ret;
>> +
>> +        if (ret < 0)
>> +            ath11k_warn(ab, "failed to set group key of idx %d for 
>> vdev %d: %d\n",
>> +                    i, arvif->vdev_id, ret);
>> +    }
>> +
>> +    return first_errno;
>> +}
>> +
>>   static int ath11k_mac_op_set_key(struct ieee80211_hw *hw, enum 
>> set_key_cmd cmd,
>>                    struct ieee80211_vif *vif, struct ieee80211_sta *sta,
>>                    struct ieee80211_key_conf *key)
>> @@ -4326,6 +4360,7 @@ static int ath11k_mac_op_set_key(struct 
>> ieee80211_hw *hw, enum set_key_cmd cmd,
>>       struct ath11k_vif *arvif = ath11k_vif_to_arvif(vif);
>>       struct ath11k_peer *peer;
>>       struct ath11k_sta *arsta;
>> +    bool is_ap_with_no_sta;
>>       const u8 *peer_addr;
>>       int ret = 0;
>>       u32 flags = 0;
>> @@ -4386,16 +4421,57 @@ static int ath11k_mac_op_set_key(struct 
>> ieee80211_hw *hw, enum set_key_cmd cmd,
>>       else
>>           flags |= WMI_KEY_GROUP;
>>   -    ret = ath11k_install_key(arvif, key, cmd, peer_addr, flags);
>> -    if (ret) {
>> -        ath11k_warn(ab, "ath11k_install_key failed (%d)\n", ret);
>> -        goto exit;
>> -    }
>> +    ath11k_dbg(ar->ab, ATH11K_DBG_MAC,
>> +           "%s for peer %pM on vdev %d flags 0x%X, type = %d, num_sta 
>> %d\n",
>> +           cmd == SET_KEY ? "SET_KEY" : "DEL_KEY", peer_addr, arvif- 
>>  >vdev_id,
>> +           flags, arvif->vdev_type, arvif->num_stations);
>> +
>> +    /* Allow group key clearing only in AP mode when no stations are
>> +     * associated. There is a known race condition in firmware where
>> +     * group addressed packets may be dropped if the key is cleared
>> +     * and immediately set again during rekey.
>> +     *
>> +     * During GTK rekey, mac80211 issues a clear key (if the old key
>> +     * exists) followed by an install key operation for same key
>> +     * index. This causes ath11k to send two WMI commands in quick
>> +     * succession: one to clear the old key and another to install the
>> +     * new key in the same slot.
>> +     *
>> +     * Under certain conditions—especially under high load or time
>> +     * sensitive scenarios, firmware may process these commands
>> +     * asynchronously in a way that firmware assumes the key is
>> +     * cleared whereas hardware has a valid key. This inconsistency
>> +     * between hardware and firmware leads to group addressed packet
>> +     * drops after rekey.
>> +     * Only setting the same key again can restore a valid key in
>> +     * firmware and allow packets to be transmitted.
>> +     *
>> +     * There is a use case where an AP can transition from Secure mode
>> +     * to open mode without a vdev restart by just deleting all
>> +     * associated peers and clearing key, Hence allow clear key for
>> +     * that case alone. Mark arvif->reinstall_group_keys in such cases
>> +     * and reinstall the same key when the first peer is added,
>> +     * allowing firmware to recover from the race if it had occurred.
>> +     */
>>   -    ret = ath11k_dp_peer_rx_pn_replay_config(arvif, peer_addr, cmd, 
>> key);
>> -    if (ret) {
>> -        ath11k_warn(ab, "failed to offload PN replay detection %d\n", 
>> ret);
>> -        goto exit;
>> +    is_ap_with_no_sta = (vif->type == NL80211_IFTYPE_AP &&
>> +                 !arvif->num_stations);
>> +    if ((flags & WMI_KEY_PAIRWISE) || cmd == SET_KEY || 
>> is_ap_with_no_sta) {
>> +        ret = ath11k_install_key(arvif, key, cmd, peer_addr, flags);
>> +        if (ret) {
>> +            ath11k_warn(ab, "ath11k_install_key failed (%d)\n", ret);
>> +            goto exit;
>> +        }
>> +
>> +        ret = ath11k_dp_peer_rx_pn_replay_config(arvif, peer_addr, 
>> cmd, key);
>> +        if (ret) {
>> +            ath11k_warn(ab, "failed to offload PN replay detection 
>> %d\n",
>> +                    ret);
>> +            goto exit;
>> +        }
>> +
>> +        if ((flags & WMI_KEY_GROUP) && cmd == SET_KEY && 
>> is_ap_with_no_sta)
>> +            arvif->reinstall_group_keys = true;
>>       }
>>        spin_lock_bh(&ab->base_lock);
>> @@ -4994,6 +5070,7 @@ static int ath11k_mac_inc_num_stations(struct 
>> ath11k_vif *arvif,
>>           return -ENOBUFS;
>>        ar->num_stations++;
>> +    arvif->num_stations++;
>>        return 0;
>>   }
>> @@ -5009,6 +5086,7 @@ static void ath11k_mac_dec_num_stations(struct 
>> ath11k_vif *arvif,
>>           return;
>>        ar->num_stations--;
>> +    arvif->num_stations--;
>>   }
>>    static u32 ath11k_mac_ieee80211_sta_bw_to_wmi(struct ath11k *ar,
>> @@ -9540,6 +9618,21 @@ static int ath11k_mac_station_add(struct ath11k 
>> *ar,
>>           goto exit;
>>       }
>>   +    /* Driver allows the DEL KEY followed by SET KEY sequence for
>> +     * group keys for only when there is no clients associated, if at
>> +     * all firmware has entered the race during that window,
>> +     * reinstalling the same key when the first sta connects will allow
>> +     * firmware to recover from the race.
>> +     */
>> +    if (arvif->num_stations == 1 && arvif->reinstall_group_keys) {
>> +        ath11k_dbg(ab, ATH11K_DBG_MAC, "set group keys on 1st station 
>> add for vdev %d\n",
>> +               arvif->vdev_id);
>> +        ret = ath11k_set_group_keys(arvif);
>> +        if (ret)
>> +            goto dec_num_station;
>> +        arvif->reinstall_group_keys = false;
>> +    }
>> +
>>       arsta->rx_stats = kzalloc(sizeof(*arsta->rx_stats), GFP_KERNEL);
>>       if (!arsta->rx_stats) {
>>           ret = -ENOMEM;
>>
>> base-commit: 4cedae6335644a5858e1bc2c367aedc10482b654
> 

-- 
--
Ramesh


