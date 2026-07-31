Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC798C55172
	for <ath11k@archiver.kernel.org>; Fri, 31 Jul 2026 21:54:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KyL63mK++l5sw6+BQZdb83d7l2zlgQEos01najAXNC4=; b=qE765+1eQjxpqubVo73JrMPS3K
	Bv3H/kP8yg0Ako8HiTODNXkrGJS7aIsolTC9g3C9O53yzo6pDddCkG3CNka7C0uTynOvV2GSD2EeE
	oiNw77hDo0Cb7mvlTvxYKipF6+AX6DYX7nbc7yWSyiwKN3rCVXpZvJXrLDqosTkjp/yvmFUJoZ0FP
	TLhuohBwvpgbaTuGnGFKWV32MdMBDGGkl6iaM2NaFXoO4+BwwzyNfsrn68SBPDKP8Auxr2b7VSIxp
	iqKRvGKxfocEG6iqCKg1GeUI4JXt2wvpl4/Lyo8s46gaa5fo5hLfZX4pz81gNKRRqlao5HBISV3MG
	VKuVbkCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpvBW-0000000De96-0Jhc;
	Fri, 31 Jul 2026 21:54:30 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpvBT-0000000De8X-1xHc
	for ath11k@lists.infradead.org;
	Fri, 31 Jul 2026 21:54:28 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66VKMI14696055
	for <ath11k@lists.infradead.org>; Fri, 31 Jul 2026 21:54:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KyL63mK++l5sw6+BQZdb83d7l2zlgQEos01najAXNC4=; b=S1IRVGb+Uqf94eMb
	3yKvcdBzHlVdSDYSKtTPq9+DbBGjcBcn273oH9gAZJnrZkvkdUsT6N3AyoOI2IPB
	3VBWaxP+g5K8ph+bGOO38JZCH3W1HQBuukoy2xYeUMmpeh8/oOqnoRlL3mYYws3d
	meIqAAjOSBYJpi3P0JxQYPANVXAwsxjSrXgYfQdo/YtjseFMDvfH0vMDyyiT++tU
	kwskAMhzRxjDSe9R80mIfN7vVBw0dOoJqN1Q54VBmnKivdTtWFPaSyBDa1vSpRIa
	U9N4k+12dNfbbDOb1TXEse3eK1hY4cdaoUaoF8+OuNNbptWxQ/44fA/HPsy3QiIl
	X8JT4w==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4frugh2f16-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Fri, 31 Jul 2026 21:54:26 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3811279d51aso2580822a91.1
        for <ath11k@lists.infradead.org>; Fri, 31 Jul 2026 14:54:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785534866; x=1786139666; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=KyL63mK++l5sw6+BQZdb83d7l2zlgQEos01najAXNC4=;
        b=gQbZDxDYZe1mS+DxfXB3o15stiKf9OVtdIWjTWjBPWfCUtsH/sRA3/2ipyyYvodhUY
         AXWJm6f7Gtv5ycxV+Q7ovLtQqEufQ7d18yKyPmltxxhc2dtdJR0bLafuGQwzIsQxlQkE
         zbDvAP/OldI0MIZmIv/64pKTAoHIzi9zcWHcim+sN4B8tEQOUdQbKBBL6T+zsAnOLwfb
         O++Ak8FQ7cfn+DU0yDuJCO2mDSiSDkz5n9TBV+79hBjicbPpzuTPqDHTdF1CWfM89clS
         4AcJh+DCiBm9qwr+bD6qc+CMyHVjC8OtsbWhNEGEYLUzDs40bJqeUMGYu801Sx8ISI46
         d0DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785534866; x=1786139666;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KyL63mK++l5sw6+BQZdb83d7l2zlgQEos01najAXNC4=;
        b=gyFynFCwZP7mB8JGuyf34C17wlcPO4X1GK5dBdWcKtK5N+WN19U/t5Oi7e5UYZxDPn
         fXXeUAdITo5OPwPg3FI2MfWroNZwrrevcL1lVxI5gzNLn2brjbv1PUxhRUP9YgDwJBi5
         yjI1kTrziVjNjSAtdhcBQDXvk9ZuA2JQpM54aw8RYzo8jHXBP+MRvC5l6eIQqF6SZlx/
         ae5tn7ECQess2ARhoLokzGrBeWfjO/KgLsTxFhi6MFsL/1KFw8XyQI7NU9snSo4vho4I
         vEFVRaqbOdlTE1P1IOBlW6m3zjig1cdFSGO4mJ3pIfnVp/WKEsgC4lHMOW71bTiFc98Q
         csDg==
X-Forwarded-Encrypted: i=1; AHgh+RoGpFvUmVoiMuvE+oTb/M1WvcE3PaQUEheMxLYBp2+nKZoUzviVJBSGumASzyJ/Eq79l8B5Vlc=@lists.infradead.org
X-Gm-Message-State: AOJu0YyLZcY3erjnsZlZFM0CxgzveBpai/h6GA1kerHdmWJUlRTdx1mg
	pydFUVBqAo2OobyDGE2qiRI652v8Fv/4ykGz197KquH5fRbO/a6fSl4lZVTXrrdnEU7qK3aXE+b
	YEPm9IO+G9NeDOe3sXZW+Mlr6tSP9EVpjg9a4AGBvtwXuyxVWhYhcDWmQUf98pZ4gNnSGJ8Uo
X-Gm-Gg: AR+sD10LX9j/6Li+VDzgRl9kLk272yEuWNVfZkKlNwMzRkYlK85vEiFW86YtLF7g1EL
	soMq76YQVmlwK/F/bTVAlAe6All/YdghbWQKrRLm2aYMypVNNByyvsMtcrlF3OCzEwan2IAnb3Y
	8TkHRErpyIJ/wVrAFVdr42ASYvcO8ADK0iIB9mtO9XvBxeUsomCE6dSu9FE22FmExP4oV6323/t
	HNu2IzK6Rgl++FCbEremc0CKD3WZxMkOiRLBOIpFhKET3DwTjgvpyyHc1gCHSa2k7eE4T/f+4lb
	lahtY3p0qY+kVosKYksyKKSp2IwgNx3qYl1QiMo5GvEd/VkwA5YDM+Wz6vBUwlQ4dHjYfO7/WJY
	wObom7dK4rjQhygrEJIQpw4P6ixtRLGvAijk5HaUP0Iq3J+jZDiwyU00SMvA=
X-Received: by 2002:a05:6a21:7002:b0:3c2:dcdd:a861 with SMTP id adf61e73a8af0-3c92a85c953mr1280829637.43.1785534865770;
        Fri, 31 Jul 2026 14:54:25 -0700 (PDT)
X-Received: by 2002:a05:6a21:7002:b0:3c2:dcdd:a861 with SMTP id adf61e73a8af0-3c92a85c953mr1280812637.43.1785534865384;
        Fri, 31 Jul 2026 14:54:25 -0700 (PDT)
Received: from [192.168.1.9] (103.sub-97-215-187.myvzw.com. [97.215.187.103])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153dd4e47dsm13745328eec.3.2026.07.31.14.54.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Jul 2026 14:54:24 -0700 (PDT)
Message-ID: <38e9f9a0-d74a-429c-8830-5552fd1b32c4@oss.qualcomm.com>
Date: Fri, 31 Jul 2026 14:54:23 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-current v2] wifi: ath11k: reset ar->num_station on
 hardware start
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: Nicolas Escande <nico.escande@gmail.com>, ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20260730140306.133718-1-nico.escande@gmail.com>
 <272a4819-d966-4be9-a533-eceb7ae0a552@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <272a4819-d966-4be9-a533-eceb7ae0a552@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMxMDE2NSBTYWx0ZWRfX0t11bm4yHMf+
 mKWu2mbSSEdLTBn7IZYmDrEwd3fc73IlywjUXh+9wp6QGeCuS37+m6h3KhTw2tTuiHZhAazVGTZ
 QU6/taa0X5cPzTtF86bh6WaBxbo0EZu7RNyJZD6fE0PVeSEcXLP8qkJNtR62QhQoRyUDyS9sHzM
 BlAnsXv9wVcHTq2G+iHbyPzIzUxrMlWCZRoHnrKuSunT1w6cOqkxbKjE24O1xa0gjrq0K/+PoJu
 wljjNCEiBuPUhwWsMxigh1J11qhT9NmD8ORl+toqAz5TerFv8BO8FXYmXVLrJdlj9NsycTWlzrU
 NpKoEKhMUFDUq5C1fgucvNnmGPNdgd0pQJNSn7ZjvdC+O6PkmiHe6b+G6DtDq8igXHBAmumhaBV
 unkPVW/WGdGEN+GvdylObiWC11/ygQq3/HC5tWlwgDN1g45i7fyLSCv6rCx7OXtk2uMn/AfbJi+
 pgHbSJDB0TEW2PUe0xQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMxMDE2NSBTYWx0ZWRfX6Azvd3JF2Ubl
 fQ49wu+0JcHjAU6adZXa0YKhIkKuOcTk966g8ZE3YLzXF1PTaTvNWpdeD42DWrLstBZQiaTvrd9
 zjhRGSPj/NPdUhBEEDGIy6OQAHXmkGM=
X-Authority-Analysis: v=2.4 cv=U+iiy+ru c=1 sm=1 tr=0 ts=6a6d1992 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=UaEkX0D7FlC0tWE/LoNF7Q==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=nBSiXhH3qYJRaR7yieIA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: 6-My-IwswvBxwbxwZpFXOkrNtZYufji3
X-Proofpoint-GUID: 6-My-IwswvBxwbxwZpFXOkrNtZYufji3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_06,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0 adultscore=0
 impostorscore=0 suspectscore=0 bulkscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607310165
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260731_145427_682762_B3F3AC9C 
X-CRM114-Status: GOOD (  11.48  )
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

On 7/31/2026 9:35 AM, Jeff Johnson wrote:
> On 7/30/2026 7:03 AM, Nicolas Escande wrote:
>> When (multiple) hw restart occurs, we end up in a situation where we
>> cannot accept new stations / mesh peers. This seems to be the
>> 'num_stations' in 'struct ath11k' that did not get reset properly in
>> this case. In ath11k_mac_op_start(), it was indeed the only accounting var
>> that did not get reset so let's clear it too.
>>
>> This avaoids problems like those:
>>
>> 	[1248828.088023] WARNING: CPU: 0 PID: 12281 at net/mac80211/util.c:1682 ieee80211_reconfig_stations+0x98/0xc0
>> 	[1248828.088029] Modules linked in: ath11k_pci XXX [last unloaded: ath11k_pci]
>> 	[1248828.088053] CPU: 0 UID: 0 PID: 12281 Comm: kworker/0:0 Tainted: G        W          XXX
>> 	[1248828.088058] Tainted: [W]=WARN
>> 	[1248828.088059] Hardware name: XXX (DT)
>> 	[1248828.088060] Workqueue: events_freezable ieee80211_restart_work
>> 	[1248828.088064] pstate: 60000005 (nZCv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
>> 	[1248828.088068] pc : ieee80211_reconfig_stations+0x98/0xc0
>> 	[1248828.088070] lr : ieee80211_reconfig_stations+0x94/0xc0
>> 	[1248828.088073] sp : ffffff800025bc10
>> 	[1248828.088074] x29: ffffff800025bc10 x28: 0000000000000001 x27: ffffff8027b19640
>> 	[1248828.088078] x26: ffffff802a5619c8 x25: ffffff8027b199f0 x24: ffffff8027b19880
>> 	[1248828.088082] x23: ffffff802a560e40 x22: ffffff8027b18880 x21: ffffff802a560800
>> 	[1248828.088087] x20: 0000000000000001 x19: ffffff8027c71000 x18: ffffffffffffffff
>> 	[1248828.088091] x17: 128c0801a9c37469 x16: 766e692d32464545 x15: ffffffffffffffff
>> 	[1248828.088095] x14: 000000000000001f x13: 00000000000000b1 x12: 0000000000000001
>> 	[1248828.088099] x11: ffffffc081061518 x10: ffffff800025baf0 x9 : ffffffc0808097f8
>> 	[1248828.088103] x8 : 00000000ffffffd0 x7 : 0000000000000000 x6 : 000000000000003f
>> 	[1248828.088107] x5 : 0000000000000000 x4 : 0000000000000000 x3 : ffffff8011ef2e80
>> 	[1248828.088110] x2 : 0000000000000000 x1 : ffffff8011ef2e80 x0 : 00000000ffffff97
>> 	[1248828.088115] Call trace:
>> 	[1248828.088116]  ieee80211_reconfig_stations+0x98/0xc0 (P)
>> 	[1248828.088119]  ieee80211_reconfig+0x774/0x1438
>> 	[1248828.088123]  ieee80211_restart_work+0x10c/0x178
>> 	[1248828.088127]  process_one_work+0x178/0x3c0
>> 	[1248828.088130]  worker_thread+0x280/0x440
>> 	[1248828.088133]  kthread+0xe0/0xf8
>> 	[1248828.088137]  ret_from_fork+0x10/0x20
>> 	[1248828.088141] ---[ end trace 0000000000000000 ]---
>> 	[1248828.090658] mesh1: HW problem - can not stop rx aggregation for 72:fc:8f:a8:f1:ed tid 0
>> 	[1248828.090667] mesh1: HW problem - can not stop rx aggregation for 72:fc:8f:a8:f1:ed tid 3
>> 	[1248828.090670] mesh1: HW problem - can not stop rx aggregation for 72:fc:8f:a8:f1:ed tid 4
>> 	[1248828.090689] wlan2: HW problem - can not stop rx aggregation for 78:64:c0:26:8e:69 tid 0
>> 	[1248828.090694] wlan2: HW problem - can not stop rx aggregation for 78:64:c0:26:8e:69 tid 1
>> 	[1248828.090697] wlan2: HW problem - can not stop rx aggregation for 78:64:c0:26:8e:69 tid 5
>> 	[1248828.090700] wlan2: HW problem - can not stop rx aggregation for 78:64:c0:26:8e:69 tid 6
>> 	[1248828.090704] wlan2: HW problem - can not stop rx aggregation for be:3b:3d:84:3a:00 tid 0
>> 	[1248828.090707] wlan2: HW problem - can not stop rx aggregation for be:3b:3d:84:3a:00 tid 1
>> 	[1248828.090710] wlan2: HW problem - can not stop rx aggregation for be:3b:3d:84:3a:00 tid 6
>> 	[1248836.686596] ath11k_warn: 39 callbacks suppressed
>> 	[1248836.686604] ath11k_pci 0000:04:00.0: refusing to associate station: too many connected already (128)
>> 	[1248836.686609] ath11k_pci 0000:04:00.0: Failed to add station: e8:51:9e:d6:93:22 for VDEV: 1
>> 	[1248941.120126] ath11k_pci 0000:04:00.0: failed to flush sta transmit queue, data pkts pending 2
>> 	[1248941.120186] ath11k_pci 0000:04:00.0: failed to clear all peer keys for vdev 2: -2
>> 	[1248941.120190] ath11k_pci 0000:04:00.0: Failed to disassociate station: 92:14:23:65:57:fc
>> 	[1248941.120196] ath11k_pci 0000:04:00.0: failed to lookup peer 92:14:23:65:57:fc on vdev 2
>> 	[1248941.120200] ath11k_pci 0000:04:00.0: failed to find peer vdev_id 2 addr 92:14:23:65:57:fc in delete
>> 	[1248941.120204] ath11k_pci 0000:04:00.0: Failed to delete peer: 92:14:23:65:57:fc for VDEV: 2
>> 	[1248941.120207] ath11k_pci 0000:04:00.0: Failed to remove station: 92:14:23:65:57:fc for VDEV: 2
>> 	[1248941.121319] ath11k_pci 0000:04:00.0: refusing to associate station: too many connected already (128)
>> 	[1248941.121326] ath11k_pci 0000:04:00.0: Failed to add station: 92:14:23:65:57:fc for VDEV: 2
>> 	[1248941.123036] ath11k_pci 0000:04:00.0: refusing to associate station: too many connected already (128)
> 
> In addition to Baochen's comments please review the guidelines on trimming
> backtraces at:
> 
> https://www.kernel.org/doc/html/latest/process/submitting-patches.html#backtraces-in-commit-messages
> 

Also s/num_station/num_stations/ in the subject

