Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A398C88E72
	for <ath11k@archiver.kernel.org>; Tue, 15 Sep 2026 02:20:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PRRE+UZDbFWUSTbpMf4eK7mNPwPbcs1iwqCTx/rSKpI=; b=BSWPekQjlUw7ZZCSGlZiC5UYzv
	7TlybSOs0Q4MBtZxOdB0PHdjflT6C/e6FPK6U09869sq+t/JbGANuxGzFKcZvZXj6HqXfDgUt3ItQ
	Z5OWOeV6DDXe7yG0KrvXgWAJCxzZCO5NfHn1SWULkcft4XaMdl0SWZ+InSPaG9NbY7+n2gZAyjW3A
	lEkrkhj/kiS+0Lv7iGKw2rXFon9rGLtLI4QsWVYgIm7nKwlWV6448v9YgKEK81XSUYI6Jw89sTmWo
	0pAWBOgxh8UsJ1WnRvXgVP2CxG6m/9oDLQGV6y4GQOdRF+SS+3bJYnDMtchNpJYcyzsCoqzOz4RZT
	RfUh75Dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Imw-000000052sW-0kev;
	Tue, 15 Sep 2026 02:20:50 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Imt-000000052ri-2PhZ
	for ath11k@lists.infradead.org;
	Tue, 15 Sep 2026 02:20:48 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68EN03aD1440524
	for <ath11k@lists.infradead.org>; Tue, 15 Sep 2026 02:20:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PRRE+UZDbFWUSTbpMf4eK7mNPwPbcs1iwqCTx/rSKpI=; b=pdhdPGav5xUdGu0j
	jqLG34NDXpSksBvAx6j6ZxjMuMivEn6809pw3dGzv/cqvBVABZBuB7UseSvNzHB1
	8WuOmKQJWW7RrG9XNSTAZ7tD3kQ0JTmClf9zZOvF7wjxiiP2mHnFeKtE5RLdnUpy
	6p7Sz4MZCvIB9CBvIusJ+JP3ntSWJ2yxqQ3KR3+71te36MDx7emh+3znEC12gc3l
	/9q6esypxjPJz5xLDp3o2b2Iq4syxJCTpIpH2MYzdHwjtT7pubdIUWLh87mncx+N
	zLYfY2krLF6C8IwCt/ikxDBPZA3EcFxHe02R7keV0s4lnBksIqPiRYDfKmpnjALd
	VTG8Cg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpeuqbfxq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Tue, 15 Sep 2026 02:20:46 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38f97b3f853so6798468a91.3
        for <ath11k@lists.infradead.org>; Mon, 14 Sep 2026 19:20:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789438845; x=1790043645; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=PRRE+UZDbFWUSTbpMf4eK7mNPwPbcs1iwqCTx/rSKpI=;
        b=aqSvFUbdJavPfjVPU7qzLKSHYXdhPz0i71Ms7ko8et/X5gshovQDqaZiL7kB7rozQ2
         qOdNCH3/8XtOkQrqKHHcKffRgov4H1+66c7Qs+oLkV2aXOhFUP+fAWC1mXeaC9lN8ABY
         FNSbUNVaQCKEFhJZPwWJxY7kZPr/+QUPCxZ1s+tOSrlkXijDdAJumfXCHST1SRdak4Hk
         wcPbSIeIuezUOhFD+K5RY8pPh/32+dYzlJWDMfnNbo1HDF1uRBgJ59uuqtrSzd8avcZp
         WK7H5NxzxGBc0jFcOPySy0dJSs/9iZWxCjQfkGw+TmItgnB8mlYnRBY0JIPE1OLx3dmh
         IpsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789438845; x=1790043645;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PRRE+UZDbFWUSTbpMf4eK7mNPwPbcs1iwqCTx/rSKpI=;
        b=lcUoTUgSTKwK1hnl4EGGVnaEtnhXoN9CBoAvvpWbI6xqwk74iy8vrFdgOrCtxCh2j/
         mv4rVj8CMAdScfY46IZe8sLz1SS3QqNiTeRa6mEvZSIZFMK4PTB4YzBJI4X0UzdxBEez
         UMVry8/YmWYtyKfIPBsPjF82+9Gj7h8egS4JiiUyug8qUBvWGaLT8FwIHIoJX0GoMCCr
         Ww2k7qHijwDDU3vpPjOalmIfsk7M11Wp2JfE5NwchVXWmLZAJJI0TW3Q22d6qEGpITRX
         W0yUw8PrK/1x3IRl1O05cNA4WfnwD5KrGsfYazcCdHmBoTzmiUdZ4LRTYJHqTEYpZcEH
         zZ/g==
X-Forwarded-Encrypted: i=1; AKwUvBytWfCX49tH45iJjJaJO5kHCD+1RBx1rlMsY8dH90R7hH7bQcNpMimjWIgx2TBadI/EVyjqBIo=@lists.infradead.org
X-Gm-Message-State: AFuF++lmMUmmYpO6CIcFWOMr83yFl8zW52OtDwvGaV1+YUhPdUJie5jL
	AF+5PPm5c4zUJ+2MUIWL9xuE8FaVR8tK62W8XA8ZGOOLjHIQDIYaUHUfq1rTt9u38W1qDZaeukV
	SUlFog5M+THmU53SSMkHhehPcezG3gi8kYhzI2QvTqZVtW/RH8A08VCfdLeZp4/9YQ6j3cw9m
X-Gm-Gg: AYBFou2bPJ/G5g/INg6E6wYVM/x7A8/2Naxq1BYYsufISEOolCOr3o2ffYJlM+qcNGm
	v7ROv49LZKjipSkbzlTaKLYrXvpvvdk8Ff2Juj+MY9K7VBGotaA45Iw7BIE9UDjZW/0+/N5NPtY
	kV+rp0DDTmtyVfBy6n1FvMGOtj7P7Jas3CGX/y9g52yWnxa+m9UvIMeChiLdaD71so77TcGdtzG
	2aSqELruggLVh32fOovSHGOYYtwR0kOdjBy/IlrOQTzimiZGWSmM+LNyL8X4w+SNqkqQHg3HH4p
	MnhKvnVanXsWYI5n3VvBd2PozgQ575icD71pTxv7ZgQ4ZNh3pnVieJmrUd0hs6EwAarqMRjW6QY
	prb3R60UA1mtjhmIOCwl+sFZF3Uobi8tlLuzQOyVT
X-Received: by 2002:a17:90a:d648:b0:39d:cbb1:c96f with SMTP id 98e67ed59e1d1-39dec09a779mr10055126a91.18.1789438845590;
        Mon, 14 Sep 2026 19:20:45 -0700 (PDT)
X-Received: by 2002:a17:90a:d648:b0:39d:cbb1:c96f with SMTP id 98e67ed59e1d1-39dec09a779mr10055074a91.18.1789438845138;
        Mon, 14 Sep 2026 19:20:45 -0700 (PDT)
Received: from [10.230.189.30] ([27.61.59.201])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1438d1381c2sm2720203c88.10.2026.09.14.19.20.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 19:20:44 -0700 (PDT)
Message-ID: <3e7b15b0-3fc8-49fc-be6e-23d651a2161c@oss.qualcomm.com>
Date: Tue, 15 Sep 2026 07:50:40 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-current v3] wifi: ath11k: reset ar->num_stations on
 hardware start
To: Nicolas Escande <nico.escande@gmail.com>, ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20260812-num-station-v3-1-871d20e043f6@gmail.com>
From: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260812-num-station-v3-1-871d20e043f6@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDAzMCBTYWx0ZWRfX2RJEerdQuUE1
 d/hCUMTX290v8lCBF6B0R7SGuTmF+kHSYaTxH10+EwK7wH5y3Zt0/z9HemRJRPd2vU2DJvQfSbF
 5838DWsR0RYIEovmBEsRuiFbItWUySeOiNscWaOtUvgVsCGUvKy68xELFSgXP3ePgNZFDoMrCg+
 NIFjx36AN8wCZTGlkmxwPw4e9rqNBd6Uk7jnjpNrIN2DjUa1UG81Clk/H1sL6mu/08wjT8Aafck
 Rg+P3zj0m9z11NQI+DewPxH0Msy4XZHIdDZBMrpkrEURFM///WccyBSGdMjW1oM4fifY3M18Rhl
 L8xaFVmFz/ldDlXo+SMroMLnZ5c47ZYhSSwt9Hk9UtZNCzDbFZDbbw6LQaXqR1AoZ5Tq7QRLuQ6
 m/Z+yc2Y3Nz5yYSdn3iSRxp7K0Bbi9NlNNvZBuEVQSEYbGN79boBQvfgLjcppyz4RPy4GaNWJ2s
 AHOxgdwJrEPU1puDk5w==
X-Authority-Analysis: v=2.4 cv=TrFzFzXh c=1 sm=1 tr=0 ts=6aa8ab7e cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ecYIMxqgMxwo3LF2e/bUvA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=XDoMHiau_i5UK2d4cvIA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: owjQoiyPg62Vn8emKfSot5fv0ekYiwhb
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDAzMCBTYWx0ZWRfX9PffsMCZ5f/4
 oVJ4MLtP+QX24reoADOhcncn2ICqN2I0PTJ3wzM9X20lNhdfOgrcQ3zOt2IowF9hX+TjIrSWC+o
 NKaTkbdxM/TZyHAkYLmXiYuOKtzie30=
X-Proofpoint-GUID: owjQoiyPg62Vn8emKfSot5fv0ekYiwhb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_05,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 clxscore=1015 suspectscore=0 impostorscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609150030
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_192047_629859_EAB0050E 
X-CRM114-Status: GOOD (  11.09  )
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

On 8/12/2026 8:28 PM, Nicolas Escande wrote:
> When (multiple) hw restart occurs, we end up in a situation where we
> cannot accept new stations / mesh peers. This seems to be the
> 'num_stations' in 'struct ath11k' that did not get reset properly in
> this case. In ath11k_mac_op_start(), it was indeed the only accounting var
> that did not get reset so let's clear it too.
> 
> This avoids problems like those:
> 
> 	[1248828.088023] WARNING: CPU: 0 PID: 12281 at net/mac80211/util.c:1682 ieee80211_reconfig_stations+0x98/0xc0
> 	[1248828.088115] Call trace:
> 	[1248828.088116]  ieee80211_reconfig_stations+0x98/0xc0 (P)
> 	[1248828.088119]  ieee80211_reconfig+0x774/0x1438
> 	[1248828.088123]  ieee80211_restart_work+0x10c/0x178
> 	[1248828.088127]  process_one_work+0x178/0x3c0
> 	[1248828.088130]  worker_thread+0x280/0x440
> 	[1248828.088133]  kthread+0xe0/0xf8
> 	[1248828.088137]  ret_from_fork+0x10/0x20
> 	[1248828.088141] ---[ end trace 0000000000000000 ]---
> 	[1248836.686604] ath11k_pci 0000:04:00.0: refusing to associate station: too many connected already (128)
> 	[1248836.686609] ath11k_pci 0000:04:00.0: Failed to add station: xx:xx:xx:xx:xx:xx for VDEV: 1
> 
> Tested-on: QCN9074 hw1.0 PCI WLAN.HK.2.9.0.1-01977-QCAHKSWPL_SILICONZ-1
> 
> Fixes: d5c65159f289 ("ath11k: driver for Qualcomm IEEE 802.11ax devices")
> Signed-off-by: Nicolas Escande <nico.escande@gmail.com>
Reviewed-by: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>

