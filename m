Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 386D8C54F54
	for <ath11k@archiver.kernel.org>; Fri, 31 Jul 2026 05:41:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NX/iu0bYhziICD5K+z/Rbj/ZTb4Lq5nCvI8MiPr7q7g=; b=MkmNNruD8d4UZ3ah/zeQ4cA3tE
	MSgs60uuHPV8mkyyq8XpVyj2Vnmojtw+0G4QkH6a6hYjNNdPuSPdIqHTrnOjAlNm4b60SpBekoFA+
	7YDziDrIh+mt6O4u5OgMX7iefrX567PAUXsmerm1El81COq/0sKAAkh5EWUVENWuKdCXkdn/gjwps
	gDVoxOV73v1I9DOUJ5hahXgJu1bK5BWJzcSv8cOS3klnTlHrolBon9jZ406MlgVLeiOsGVZuCxReo
	wAQWCyWj00MLLovaGgZ7aLpS9Lid+qCkCFqxpS8HO55jZ34EvexHOYmawuN+REBjeZyry3xh6VjWF
	UgrbmCpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpfzp-0000000BorL-2uht;
	Fri, 31 Jul 2026 05:41:25 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpfzm-0000000Boqz-0TzQ
	for ath11k@lists.infradead.org;
	Fri, 31 Jul 2026 05:41:24 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66V56afF2927764
	for <ath11k@lists.infradead.org>; Fri, 31 Jul 2026 05:41:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NX/iu0bYhziICD5K+z/Rbj/ZTb4Lq5nCvI8MiPr7q7g=; b=FLkF40NiXSqVmjIW
	zNZ5EGqu2gv8A/aZcogpGSvLV9d2iza10HBXUqP55QgiVPqTdWtS7aqjYN7mCu6m
	PbL9yuMnHevYOk7V/mTHkAWh1klnhjFfgqldlXBetPyJc8YP+8Yrzi6nMP6uc0Jo
	LQJkOV6UXViDxR9znB0PLh6cpA+yk+pZ5tL+xfZszJhQuDuhuy2SutYbQXbJ9jcE
	eCkG3k1RmIg4lsUwyt1gOSS28MLRDpq5dLq1hXmTLbBNDoz6CxHCuBzqy+NCjOOv
	q3xPS7oamO8SnddhmgkV8sYBUSNxiiZRVT0/uMA6VXeIAuW8LaUlT1f2vHdhvAsf
	4IkBYw==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4frn92r3hq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Fri, 31 Jul 2026 05:41:21 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cbb467e56aaso741730a12.1
        for <ath11k@lists.infradead.org>; Thu, 30 Jul 2026 22:41:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785476481; x=1786081281; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=NX/iu0bYhziICD5K+z/Rbj/ZTb4Lq5nCvI8MiPr7q7g=;
        b=aCCzjdwPl2fsALvBqrjAc4P+JX3jx5NzNYrVmb63WLnEu/SySZfkBMjOOz45nqmOiV
         jE4P5iyMQoOkPal/cIZJbnXFgbQAfRYHfhaURIyWVKaxDz+nx2FMseAUEYscdBk7UQoy
         Bg61PoUB7S+O3tIeSah43etX4NYhe+hzPuzBc3niNwFUUGFy8YPliVigLyhbgx336lmK
         BGIUgeFW6a2zVp8PpzLleqMtEoIsZv/mmFj6vc1naXMDt8CofkpU0lhCr9ME7VOhINRf
         7oo+JWMCdrZHEuZU+Io+HEVuHj0crmUBpuLJB47lBdum2zMvYdewHt/xJ0gp7cjpnvVi
         NPIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785476481; x=1786081281;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NX/iu0bYhziICD5K+z/Rbj/ZTb4Lq5nCvI8MiPr7q7g=;
        b=CUqHq7O2EZWkXimY6xmjpSQ7C7jwu4YIa18qPUTU/jOx5Wr78uo/dqa+v4lLAu85yc
         JiF5x84QjoormwcME4ymZy4jlRiOq4Ik35yv2Sx9sQKkQ/jVfpn1rOdumTO50Zb9b20L
         N5YAoNedSot5dlpnVX0E4KkeJvhyvDEPw+W22hJnLF2ATHrg/7/nOZFKpYHhT04Piv/s
         tGtK2/3tpDi+bNM825MG5wZ7L6VzEHxY1AfwPL0XGg5WOZlT9FZcqMVcPUSg+W9S5ni+
         4G+j7OuAzlxYcjAhkyFWfmx3sXVE8Pnl6JsPcWbkJaZvDucmELwjKZtb/lmJmZf+wk6R
         TG0g==
X-Forwarded-Encrypted: i=1; AHgh+Rov2/NUuyd+o0MxyFHQFbILHLWSgxFQRq51wt4rc+uQpzXyczAD/dM+4AZSFuwn7rt/Qy0PYh8=@lists.infradead.org
X-Gm-Message-State: AOJu0YxBLbcCO+Z/ILed7YhTKidqmm9sEh7raUmssLjSa7WTxYu0nEY2
	E/6RDcpTAQzZ9Evfy9clbyEGF8FgcWPfACXzEHhCU7bloNe6Ma9YJXJRdNCoUzuVhlQXcH4hZE6
	216uRYgd6i3np1BjuqR8Wod88pOExjJnUdDF/arHyfcUMMnY8AyrObMEqPAc3okcduEAO3soI
X-Gm-Gg: AR+sD10ABXdU4cLXtxxUxOOq4pTekY3uzXjBqxMN6vkPxU8TjOivERdUtTY4evzXIdy
	+jWZ2uUYe3stHYaynJGdj9yE/kDY2ALGh97KPBnE8ggb1b8h8e+/hHnEZf6U3+UASwzTEES1ioJ
	r9/U3MbzcCWWvvsQCuUL6tSLgIrZ825yRoVf12uBHElsGkpms78dytctNcMHP0rZXNMFhjh0Pbp
	Vn4ScQpRJ0AFr1mKymQYe8Nu8T7KnNUEm2mU2q4R4qvgXYpXSOJtHoRYJF+3XwwHPMQScI6MCLN
	h6ieJEDr0fwD6By4AKNp9MJHd/OUiJq84kP8R7RvJrJQUqXL2kJMU9yw+BR9xe+KtyYUF5zfoeb
	lpIHzVVvgyPhdqfcwxi+5FH2aqHLLM4g6uOtVPckZ3pUcuW14XO7JEOQNyqsvHKiMkncRYGWQ3Q
	==
X-Received: by 2002:a05:6a00:399d:b0:848:30fe:da34 with SMTP id d2e1a72fcca58-84ed6f19e00mr584194b3a.45.1785476480624;
        Thu, 30 Jul 2026 22:41:20 -0700 (PDT)
X-Received: by 2002:a05:6a00:399d:b0:848:30fe:da34 with SMTP id d2e1a72fcca58-84ed6f19e00mr584178b3a.45.1785476480074;
        Thu, 30 Jul 2026 22:41:20 -0700 (PDT)
Received: from [10.133.33.123] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbe39ea11c0sm102663a12.24.2026.07.30.22.41.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jul 2026 22:41:19 -0700 (PDT)
Message-ID: <4160b5e1-c82f-4083-aa36-18e4a42f909a@oss.qualcomm.com>
Date: Fri, 31 Jul 2026 13:41:17 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-current v2] wifi: ath11k: reset ar->num_station on
 hardware start
To: Nicolas Escande <nico.escande@gmail.com>, ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20260730140306.133718-1-nico.escande@gmail.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260730140306.133718-1-nico.escande@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMxMDAzNiBTYWx0ZWRfX1Ktwsh9HXPD/
 cHZhtTGM4tdZ9ejgZViO7C5H11KNWD+86XdjEzvUD1FDLHg5//1CpUefszglWQfE3VXWyUgL/59
 fxe8iFjAb+mD6s3SzFqwci8qRmEg0fRHgEYJhBr6UvX+UUk5RnawcFvpvPd5KRo8MbOGXnZEgWL
 kKFT4cTOYI5RzmYPgkcAexFXAL4tncP9KGds4HJ9phKhxBEgmVmZ1GTP7zBiukhyGIQKRuAHZD2
 r9gwxHdQWd3XIaGI7iQeK0zJZt61cZji4H6OIaqBgt+MqBPlyatCZqPECs+xMrj9cP91NZIXgf9
 +ICgEuNyVz8Yyg6FVVezix/lxBqHt6a1vtKl64WkN79GG2Oo4PFQ/FYOqfXyErynlvSxHudeJva
 jpn6GlAaLBX8pPmgwDFlm0yxdWzpRkgYEgzC2jwVXsh8UIGxX98XvetKfqKng9ZjAufjtVx1eh6
 Ws+zaAeLUgzjM/UEBhw==
X-Authority-Analysis: v=2.4 cv=FNcrAeos c=1 sm=1 tr=0 ts=6a6c3581 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=pGLkceISAAAA:8 a=YD6fnDvLbndNWp0Zy18A:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-GUID: BAD5gT16iqEknH6DuO5LiFUzkaFa3Fx2
X-Proofpoint-ORIG-GUID: BAD5gT16iqEknH6DuO5LiFUzkaFa3Fx2
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMxMDAzNiBTYWx0ZWRfX7nUBZUdno6om
 ZuHr7KXm2oq5295DQi24p1q6O02d09YkAXq7OiIzEpApUkeQoSYKFnxlCmXIH0Q4UfZVfyC+QtL
 koOEgHSU1RhdsnY3yniYJGRNl7DCBgk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_02,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0 malwarescore=0
 bulkscore=0 priorityscore=1501 suspectscore=0 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607310036
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260730_224122_973969_1EBE51A9 
X-CRM114-Status: GOOD (  21.16  )
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

s/ar->num_station/ar->num_stations/ in subject


On 7/30/2026 10:03 PM, Nicolas Escande wrote:
> When (multiple) hw restart occurs, we end up in a situation where we

by hw restart do you mean firmware crash and then recovers ?

> cannot accept new stations / mesh peers. This seems to be the
> 'num_stations' in 'struct ath11k' that did not get reset properly in
> this case. In ath11k_mac_op_start(), it was indeed the only accounting var
> that did not get reset so let's clear it too.

the root cause description looks confused to me: if it is firmware crash and recover, we
should run the path ath11k_core_reset() -> ath11k_core_post_reconfigure_recovery() ->
ath11k_core_halt() -> ath11k_mac_peer_cleanup_all() and in that function ar->num_stations
is cleared.
> 
> This avaoids problems like those:

s/avaoids/avoids/

> 
> 	[1248828.088023] WARNING: CPU: 0 PID: 12281 at net/mac80211/util.c:1682 ieee80211_reconfig_stations+0x98/0xc0
> 	[1248828.088029] Modules linked in: ath11k_pci XXX [last unloaded: ath11k_pci]
> 	[1248828.088053] CPU: 0 UID: 0 PID: 12281 Comm: kworker/0:0 Tainted: G        W          XXX
> 	[1248828.088058] Tainted: [W]=WARN
> 	[1248828.088059] Hardware name: XXX (DT)
> 	[1248828.088060] Workqueue: events_freezable ieee80211_restart_work
> 	[1248828.088064] pstate: 60000005 (nZCv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> 	[1248828.088068] pc : ieee80211_reconfig_stations+0x98/0xc0
> 	[1248828.088070] lr : ieee80211_reconfig_stations+0x94/0xc0
> 	[1248828.088073] sp : ffffff800025bc10
> 	[1248828.088074] x29: ffffff800025bc10 x28: 0000000000000001 x27: ffffff8027b19640
> 	[1248828.088078] x26: ffffff802a5619c8 x25: ffffff8027b199f0 x24: ffffff8027b19880
> 	[1248828.088082] x23: ffffff802a560e40 x22: ffffff8027b18880 x21: ffffff802a560800
> 	[1248828.088087] x20: 0000000000000001 x19: ffffff8027c71000 x18: ffffffffffffffff
> 	[1248828.088091] x17: 128c0801a9c37469 x16: 766e692d32464545 x15: ffffffffffffffff
> 	[1248828.088095] x14: 000000000000001f x13: 00000000000000b1 x12: 0000000000000001
> 	[1248828.088099] x11: ffffffc081061518 x10: ffffff800025baf0 x9 : ffffffc0808097f8
> 	[1248828.088103] x8 : 00000000ffffffd0 x7 : 0000000000000000 x6 : 000000000000003f
> 	[1248828.088107] x5 : 0000000000000000 x4 : 0000000000000000 x3 : ffffff8011ef2e80
> 	[1248828.088110] x2 : 0000000000000000 x1 : ffffff8011ef2e80 x0 : 00000000ffffff97
> 	[1248828.088115] Call trace:
> 	[1248828.088116]  ieee80211_reconfig_stations+0x98/0xc0 (P)
> 	[1248828.088119]  ieee80211_reconfig+0x774/0x1438
> 	[1248828.088123]  ieee80211_restart_work+0x10c/0x178
> 	[1248828.088127]  process_one_work+0x178/0x3c0
> 	[1248828.088130]  worker_thread+0x280/0x440
> 	[1248828.088133]  kthread+0xe0/0xf8
> 	[1248828.088137]  ret_from_fork+0x10/0x20
> 	[1248828.088141] ---[ end trace 0000000000000000 ]---
> 	[1248828.090658] mesh1: HW problem - can not stop rx aggregation for 72:fc:8f:a8:f1:ed tid 0
> 	[1248828.090667] mesh1: HW problem - can not stop rx aggregation for 72:fc:8f:a8:f1:ed tid 3
> 	[1248828.090670] mesh1: HW problem - can not stop rx aggregation for 72:fc:8f:a8:f1:ed tid 4
> 	[1248828.090689] wlan2: HW problem - can not stop rx aggregation for 78:64:c0:26:8e:69 tid 0
> 	[1248828.090694] wlan2: HW problem - can not stop rx aggregation for 78:64:c0:26:8e:69 tid 1
> 	[1248828.090697] wlan2: HW problem - can not stop rx aggregation for 78:64:c0:26:8e:69 tid 5
> 	[1248828.090700] wlan2: HW problem - can not stop rx aggregation for 78:64:c0:26:8e:69 tid 6
> 	[1248828.090704] wlan2: HW problem - can not stop rx aggregation for be:3b:3d:84:3a:00 tid 0
> 	[1248828.090707] wlan2: HW problem - can not stop rx aggregation for be:3b:3d:84:3a:00 tid 1
> 	[1248828.090710] wlan2: HW problem - can not stop rx aggregation for be:3b:3d:84:3a:00 tid 6
> 	[1248836.686596] ath11k_warn: 39 callbacks suppressed
> 	[1248836.686604] ath11k_pci 0000:04:00.0: refusing to associate station: too many connected already (128)
> 	[1248836.686609] ath11k_pci 0000:04:00.0: Failed to add station: e8:51:9e:d6:93:22 for VDEV: 1
> 	[1248941.120126] ath11k_pci 0000:04:00.0: failed to flush sta transmit queue, data pkts pending 2
> 	[1248941.120186] ath11k_pci 0000:04:00.0: failed to clear all peer keys for vdev 2: -2
> 	[1248941.120190] ath11k_pci 0000:04:00.0: Failed to disassociate station: 92:14:23:65:57:fc
> 	[1248941.120196] ath11k_pci 0000:04:00.0: failed to lookup peer 92:14:23:65:57:fc on vdev 2
> 	[1248941.120200] ath11k_pci 0000:04:00.0: failed to find peer vdev_id 2 addr 92:14:23:65:57:fc in delete
> 	[1248941.120204] ath11k_pci 0000:04:00.0: Failed to delete peer: 92:14:23:65:57:fc for VDEV: 2
> 	[1248941.120207] ath11k_pci 0000:04:00.0: Failed to remove station: 92:14:23:65:57:fc for VDEV: 2
> 	[1248941.121319] ath11k_pci 0000:04:00.0: refusing to associate station: too many connected already (128)
> 	[1248941.121326] ath11k_pci 0000:04:00.0: Failed to add station: 92:14:23:65:57:fc for VDEV: 2
> 	[1248941.123036] ath11k_pci 0000:04:00.0: refusing to associate station: too many connected already (128)
> 
> Tested-on: QCN9074 PCI WLAN.HK.2.9.0.1-01977-QCAHKSWPL_SILICONZ-1
> 
> Fixes: d5c65159f289 ("ath11k: driver for Qualcomm IEEE 802.11ax devices")
> Signed-off-by: Nicolas Escande <nico.escande@gmail.com>
> ---
> v2:
> 	- rebased on ath/master
> 	- no code change
> ---
>  drivers/net/wireless/ath/ath11k/mac.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
> index 2d55cdc4d165..0baa46df1fb9 100644
> --- a/drivers/net/wireless/ath/ath11k/mac.c
> +++ b/drivers/net/wireless/ath/ath11k/mac.c
> @@ -6699,6 +6699,7 @@ static int ath11k_mac_op_start(struct ieee80211_hw *hw)
>  	ar->num_started_vdevs = 0;
>  	ar->num_created_vdevs = 0;
>  	ar->num_peers = 0;
> +	ar->num_stations = 0;
>  	ar->allocated_vdev_map = 0;
>  
>  	/* Configure monitor status ring with default rx_filter to get rx status


