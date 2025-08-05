Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E04CCC87FD2
	for <ath11k@archiver.kernel.org>; Tue,  5 Aug 2025 18:37:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rf//mbP0mXrK7QtQ6anN4k1iTluCGOJU5QYSOKvtHFo=; b=IZoWhrDABUMJof0D/3g5ktRt7H
	iypqBMfAdKTF2/0eTQU2A0D8ivkpnrTpLEPYhSIbtcLHz74xIfbYf78ksniO9tnbS40JCUjkIEC5B
	E5J/hvI6pgb0H5WRVpWM9AIFLshCkx7I4wRnDetzJXrYTEnd7wym3l4qx1tLCjohyGZq2tHSQ+6Jj
	aIC72H2/41gRlpy1c8d4DL/OpxfjaA/3bFFakbIwSiMAGMjFhvrb/o9+1QW4Pbivjv7/xcOxMmjAy
	FslJgHiTiVzVpOCCH3EPhv8mJOFMls9ndQpIcubcJGUHuqhRYeJLNcejN8htPdXj8d5BPLXLWjNtd
	6/fCGcHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujMX3-0000000DYXE-0yHp;
	Tue, 05 Aug 2025 18:37:05 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujLpN-0000000DTYL-0WSF
	for ath11k@lists.infradead.org;
	Tue, 05 Aug 2025 17:51:58 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 575G2KBi003583
	for <ath11k@lists.infradead.org>; Tue, 5 Aug 2025 17:51:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rf//mbP0mXrK7QtQ6anN4k1iTluCGOJU5QYSOKvtHFo=; b=N3ZlBfZiZmXM2hKo
	JyCw9vet7lfQxleS5sHzx1l0tAWbzE0pPCZav4wPDqFtgIjt0W++eeFqviqRZu0o
	p+eQy7GsExCJUG9LMzfY0pcWdgtcMs7nJKUGGMrARE6J1lGpl4zFPOygYfHP4ulQ
	kYsf9E+XJ0eGsPmHwPVQoG9MRgzWDjTpf/y6/6jfNFjDRL8YLVvMsQXsULnnQm3y
	1HQWcddKN8B/OfHLUHw7glbASRdoxTUySAZcCkUje41JqVoCmW5sPHkjLDLBbHqE
	sTxKKWOFpuqEhFbSvM5IqTnxdj5GwHFRtbdV54FqPnZaP9uus2CgKy8a1bDgEdJ4
	c5ACaA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48b3j3ubmj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Tue, 05 Aug 2025 17:51:55 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-31f32271a1fso165682a91.0
        for <ath11k@lists.infradead.org>; Tue, 05 Aug 2025 10:51:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754416314; x=1755021114;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rf//mbP0mXrK7QtQ6anN4k1iTluCGOJU5QYSOKvtHFo=;
        b=J0waNV6fR8cN1M9LNpXrOWh+5ulDpxqVDBBM5PAb+EBPRKkYQecQjEgBtYa1LCy9P1
         GjNd7WWk/xVzqtoFDZjam5zfrsbYu/Zk3OZxSHfuGNb648C6q1mzCKVBtcPs2Q2ZcVkp
         /m34EfuHPS7EFKrMcm5ipfIJd26JYwaKOhByBD56xRLJ/8GyMbccFkq4kGXkFCE3XkNp
         he9+YF1ACXbzuJkitymiV3FDNjz0LD0K5TJRqTE6DO77zJiRKkkVDUpOAK0tagqp7iaT
         hVf6c87ijmB2btTbNdghwP7vO4jn328DRHUYv/FmwYH0fk+P21mgLAIOoCE6750ikeK6
         NvpA==
X-Forwarded-Encrypted: i=1; AJvYcCUe9i+xZWT2PUhq1ewiQ27DzdzqJcmZC9tBdk6BeqjvdKl3nFSB7FLVeFZQDxWCG3/dqE488SI=@lists.infradead.org
X-Gm-Message-State: AOJu0YyexpEG+HwgRShr55KrnGtJayQH5fFYNn0qcFZ9NtJ2qPba/bDw
	zKbTuP3PrYyNPWwQOb0g2oGgBOn6rdrIPnP/cpLzYVMmDy5ssK56AFvZNWAsTXJlTNMr13F7oLY
	kcuZBUt484W2TyffwDZtlt9jAPHvQEuLITwNFWh5KQITf6YlaR0W5hWJlOGtxS8MeBE5WyMWH
X-Gm-Gg: ASbGnculkAbuM3+WNrmzb221ZuZTtLQv9XE0mfpAlGA7Q+XN2ILi/JPee9lmVNDJsRE
	GyonRnuFuwVkJqiWKGl64bEEaKwSwEwPaF/dPnN2YycC9iog6LmpjXOEvEtAj/hjX8YeVVRi3y2
	EZfDKPl/A3qpvpvuHiWOOB1QEoFUt/WRomaOO3+WCrKjQ+62ZsXMtmKgHPO5DkG0Sj71lT8Oeai
	kOkvulibGIguBTTdLdAx1/EG3APGvc70VkZ18UgxQI1lJRCDAUO9XutZqFCpoiTo8Qq8vd8rXVh
	cm0EVGqwP+LbBmUoY/w5+qOaKKW/iB4gfHqsRCZmZr5b0fWbxykyo+z4aPQDWN5Np9MxguMaauu
	rra3OvBYRqWWy89S+qduF0n1pyQvPjYNC
X-Received: by 2002:a17:90b:1c8d:b0:31e:fe21:ca43 with SMTP id 98e67ed59e1d1-3214fe6f11cmr5318322a91.4.1754416314132;
        Tue, 05 Aug 2025 10:51:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE8vHN+2k1K+J0WmbiKP+Mi36OqmEJeM2GmdLwEejlFXJ3TRGfBScl4fkVD8dNT3zipp0INeg==
X-Received: by 2002:a17:90b:1c8d:b0:31e:fe21:ca43 with SMTP id 98e67ed59e1d1-3214fe6f11cmr5318296a91.4.1754416313582;
        Tue, 05 Aug 2025 10:51:53 -0700 (PDT)
Received: from [192.168.1.111] (c-73-202-227-126.hsd1.ca.comcast.net. [73.202.227.126])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3216121ec0esm770702a91.10.2025.08.05.10.51.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Aug 2025 10:51:53 -0700 (PDT)
Message-ID: <4131b3d4-44ce-48be-b8c8-23538c0ecb86@oss.qualcomm.com>
Date: Tue, 5 Aug 2025 10:51:51 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next v3] wifi: ath11k: fix group data packet drops
 during rekey
To: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>,
        ath11k@lists.infradead.org
References: <20250804075344.3494691-1-rameshkumar.sundaram@oss.qualcomm.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20250804075344.3494691-1-rameshkumar.sundaram@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 2h59vOP9L446x711iNb3Mza08nLC0Vyh
X-Authority-Analysis: v=2.4 cv=TZ+WtQQh c=1 sm=1 tr=0 ts=689244bb cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=e70TP3dOR9hTogukJ0528Q==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=0Wns9SyGRh5zLXKo8moA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA1MDEyNCBTYWx0ZWRfX9DymTA/TpufI
 yEawFLSz8NvFtMBDiyeiqNnIqQy9vGw5Hy0jdp7WhjUY823630VZSZVW3w/1o8X8L8T3ZRXHxLC
 QRWgopLblOAwPSnpyubuYJb3Pi3jvbTVB0Ubs7SMtHj4NP23oj06NksSxjcFCcI3bdEndN3bYZK
 Gcm33+R08omiwUI1PA/DsWG1Skh8dB0+3gg++IiTxVY7jjkLjy9FhhEaNVycfS+KcWdBPSzk5da
 dD1ipgRQu9AZNcxOyQx+0GoTpQpAJmZho64ET1bWphZ5cLuKuq2Ah78ZvMdVBu97WNR/DDrvtAX
 5lk8+LZfTO4iquo3SEXFDiZIJu09bFhvh5u7zS9sxGbNjj3UcXyDdWoDoNkJq5ydNCsRWgJGyse
 YGAVyl2EakQp8OTmxaHF4zhUFP+x/Q6+rD07s40P0SFg80qp6SkkfcQUQ7aSnWlsKGnXb+mp
X-Proofpoint-ORIG-GUID: 2h59vOP9L446x711iNb3Mza08nLC0Vyh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-05_04,2025-08-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 mlxscore=0 suspectscore=0 impostorscore=0
 spamscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0 mlxlogscore=999
 phishscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2508050124
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250805_105157_214393_93EEB0C7 
X-CRM114-Status: GOOD (  27.83  )
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

On 8/4/2025 12:53 AM, Rameshkumar Sundaram wrote:
> During GTK rekey, mac80211 issues a clear key (if the old key exists)
> followed by an install key operation in the same context. This causes
> ath11k to send two WMI commands in quick succession: one to clear the
> old key and another to install the new key in the same slot.
> 
> Under certain conditions—especially under high load or time sensitive
> scenarios, firmware may process these commands asynchronously in a way
> that firmware assumes the key is cleared whereas hardware has a valid key.
> This inconsistency between hardware and firmware leads to group addressed
> packet drops. Only setting the same key again can restore a valid key in
> firmware and allow packets to be transmitted.
> 
> This issue remained latent because the host's clear key commands were
> not effective in firmware until commit 436a4e886598 ("ath11k: clear the
> keys properly via DISABLE_KEY"). That commit enabled the host to
> explicitly clear group keys, which inadvertently exposed the race.
> 
> To mitigate this, restrict group key clearing across all modes (AP, STA,
> MESH). During rekey, the new key can simply be set on top of the previous
> one, avoiding the need for a clear followed by a set.
> 
> However, in AP mode specifically, permit group key clearing when no
> stations are associated. This exception supports transitions from secure
> modes (e.g., WPA2/WPA3) to open mode, during which all associated peers
> are removed and the group key is cleared as part of the transition.
> 
> Add a per-BSS station counter to track the presence of stations during
> set key operations. Also add a reset_group_keys flag to track the key
> re-installation state and avoid repeated installation of the same key
> when the number of connected stations transitions to non-zero within a
> rekey period.
> 
> Additionally, for AP and Mesh modes, when the first station associates,
> reinstall the same group key that was last set. This ensures that the
> firmware recovers from any race that may have occurred during a previous
> key clear when no stations were associated.
> 
> This change ensures that key clearing is permitted only when no clients
> are connected, avoiding packet loss while enabling dynamic security mode
> transitions.
> 
> Tested-on: QCN9074 hw1.0 PCI WLAN.HK.2.9.0.1-02146-QCAHKSWPL_SILICONZ-1
> Tested-on: WCN6855 hw2.1 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.41
> 
> Reported-by: Steffen Moser <lists@steffen-moser.de>
> Closes: https://lore.kernel.org/linux-wireless/c6366409-9928-4dd7-bf7b-ba7fcf20eabf@steffen-moser.de
> Fixes: 436a4e886598 ("ath11k: clear the keys properly via DISABLE_KEY")
> Signed-off-by: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
> ---
> v3:
>   - Allowed clear key strictly only for AP mode
>   - Rephrased the commit text and comment in ath11k_mac_op_set_key()
>     to explain that the race occures rarely under heavy load and
>     discrepancy of states between firmware and hardware
>   - Added newline (\n) at the end of warn log in ath11k_set_group_keys()
>   - Made addr varaible as const * in ath11k_set_group_keys()
> v2:
>   - Followed r-xmas style
>   - Removed vdev_type check before calling ath11k_set_group_keys()
>   - Removed lockdep assert in ath11k_set_group_keys()
>   - Removed flags variable and passed WMI_KEY_GROUP in ath11k_set_group_keys()
>   - Changed the if condition to have positive cases in ath11k_mac_op_set_key()
>   - Added code comments in ath11k_mac_op_set_key() to explain how clear key and
>     set key are issue back to back by mac80211 and added high level information
>     about the firmware race.
>   - Added comments in ath11k_mac_op_set_key() and ath11k_mac_station_add() to
>     explain why a reinstall of same key is needed.
> ---

To clear up any confusion, this should have been a v3 posted internally for
review, and the history listed is from prior internal review.

So this is actually the first public version, but to avoid confusion, all
followup to the current public review should be incorporated in a public v4.

Also the follow-up should use the ath-current branch tag since this should be
incorporated into v6.17 instead of waiting for the v6.18 development cycle to
complete.

/jeff
/jeff


