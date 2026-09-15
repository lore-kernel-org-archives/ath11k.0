Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B76DC88E72
	for <ath11k@archiver.kernel.org>; Tue, 15 Sep 2026 02:00:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:From:Subject:Cc:To:MIME-Version:Date:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=VjazF2u6aHcCpAoZDETq19dN3ZnMJLylSSJylHYqTeM=; b=22pQBplVUtqFmiGDIzpvyaLKcY
	ud8vpujFLT+bB8y/cRfrreKq9LkO2QbEvJZD9To7UFSrJRHhI8B/V/hnsgd4cnCC9e0IdG3HUE4Ih
	Y1Gmh87xh09uDa+oTD2QUl1AWRyuI42rtXOEK3N4A0x2WwEU1nDrFdxD/3UiEl7T+uJ8bJ0Ne4L1S
	iQVV+1p5fGKoAWT6aGFVmD5yR51B+s+7PEc7o72FGnsdIACtNjwftxGJINnebO8YFXa8bQrvuP5lq
	eWAzhcaQnJp1qFjic76THTcxqPHnoVMQ7pklsA4mj8cOaL0jWY3CNBmHBcSNAG5y6ShFu3MV7xUqX
	eburAjjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6ITD-00000004ztC-4BJn;
	Tue, 15 Sep 2026 02:00:28 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6ITB-00000004zsI-1AsR
	for ath11k@lists.infradead.org;
	Tue, 15 Sep 2026 02:00:26 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68EMxfXG2826103
	for <ath11k@lists.infradead.org>; Tue, 15 Sep 2026 02:00:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=VjazF2u6aHcCpAoZDETq19
	dN3ZnMJLylSSJylHYqTeM=; b=f9ZU9bs3a5oUo9/qWaxRlLegWqegOsM98sGUek
	YpLAWywyhrft9sL+JNzBCdIcH7my5zgqWiHDWHw5ORQw1HtThXOt3iD+7Wk7Y/g7
	0f2jc0gLjIhqyZSeqFd0msrzlLQOV6g8UsIjK7G6tTi4jTGcaA+oecjGswvhC5iu
	lNzIJHC9FphsGcVU8e+Zv3e26yCywEd5Vfn+1q23f+mxD6UNXIyUUNbjnSHz3n3D
	5rfhOdsmjcSyypY2XifwcNYLwAM67wGf9YIL87zbWue9GNZKEZj54xxHXM1BjO6r
	1Uih7DDRLXLqmGOWO9aCnCMJDhGmmQqWLatN1zl40sFzxORw==
Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com [209.85.161.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpn41sp16-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Tue, 15 Sep 2026 02:00:24 +0000 (GMT)
Received: by mail-oo1-f71.google.com with SMTP id 006d021491bc7-6c1bb6ec882so3716608eaf.2
        for <ath11k@lists.infradead.org>; Mon, 14 Sep 2026 19:00:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789437624; x=1790042424; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:from:content-language
         :subject:cc:to:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=VjazF2u6aHcCpAoZDETq19dN3ZnMJLylSSJylHYqTeM=;
        b=IjwtUPqCO+vxyvuo7vjXvS6xji9gMxQ70NXbSI09y47QQNuCqRtrOZQ8o1i9Dq2pni
         pBXyfx+0jHouwz4e/TFXq09/8vxF90t7F01fvAq8IrrOtD+abjqTDb9g/N/ZmbpOfinc
         0hC94muGMYd9X+MKMkDPbpXv3p6P3xtssLIWnC7XJK90pmA/bKoi09lMIKUuRGo6TvbE
         cDwfZdFycvOuts3IXLzKbvh+s3ryCZ2P0DopzdsTBgEYt1h56ap57Jnenac3loZ+eRWT
         dGSfxOuhCCe7BrHykpjgSZGOXC0HFvMzw7V/sSS/hxwt3IJUIf/xmD8Eh9FRJ8yAGXwl
         nlkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789437624; x=1790042424;
        h=content-transfer-encoding:content-type:from:content-language
         :subject:cc:to:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VjazF2u6aHcCpAoZDETq19dN3ZnMJLylSSJylHYqTeM=;
        b=F/dbzLRfHHrVyF8wXkj3RO9n32A7GFQ4JAloiYnGcfKn/ZB2wLlzz8Ah3B9V38JTYE
         0FWGkcjqpFVfHXo2QCxEuSQM/wg9QcD9/5rbMBxq+qcDZN/QbnsQOfw6UFeHf/2tnAIu
         NQpvmoWMTdg5jjX0svPnpW/xFCeCNn3S6ecFITrim4wWun8uzOjPhve2OjxfmjrPSbGV
         mwwEyUepQRBZNbu6XUKINSff/BJymM4zyYlTdH1dYSZeuAIcDj21ah+dW6tgYyLdtEsz
         9DGQSVaZ67PIaacakpNyfVt59cv7G51gWOmQ9nhdMDfVpIedtVMJCOKqO/vO00RO5EGu
         TMKA==
X-Forwarded-Encrypted: i=1; AKwUvByy0RfkHR62ak6tvXjmiw+g4XeDWs8calcAEO9lwogxtFtqWJLiCzq0rZ85e2yZpn+/G44aeEQ=@lists.infradead.org
X-Gm-Message-State: AFuF++kafR179dqiWl72lhvTEFsIDcr+JmtMVHDk7zXlFH6FQPWbaXvq
	aH6FhblwGyTeMyZsyAs+IHuxKa/uSJklak6H8WsdzPUXnO3Kkv4ij/Yjf24wdCPdaqWm89AnJBa
	2AcUKHgxRVF18d12f12HQlZskJawQ3a5uw7a/18thfjOIcgifwlqorB0y+pHh9z1s
X-Gm-Gg: AYBFou2gKDjoHPdxXP19m5nYcwSNySA6AxoCCvXCqocDxx4G1ITyxC+maLVFL+SyOEt
	W+ecq/RmZ3euNAuhbCHfn9VvJqYlnBZgTZQc1b4Glgxqcz+/l0t1oZvTgMXqKA2uaH4lm6MZwcl
	FbsN20Q25ZXvSjRUaNhWH2/zxUH9v0j6uBnC8zehn6iQZO3nb1tuOmrtl9Gmba+0VrAakuPme6r
	aVIlrd7vtGFqg0d3XOyiPT8qrVJ8gWuD+vtSRa4FWuaftfoXTcd4/F8tkC7e0ED9I7iSj/58N+V
	TV0wxNW462egp+Q/6LRHwWqmEdwGAtSB2Q+dZK1i43zVIfJCAuojuDVvSL5z4mfwTqGmxdxpIT2
	Km48cJOOPzfEXQKT0NF067X8Q4N4fAaYRjp6R
X-Received: by 2002:a05:6820:220a:b0:6c1:6bdc:466c with SMTP id 006d021491bc7-6c5404802demr3020703eaf.20.1789437620399;
        Mon, 14 Sep 2026 19:00:20 -0700 (PDT)
X-Received: by 2002:a05:6820:220a:b0:6c1:6bdc:466c with SMTP id 006d021491bc7-6c5404802demr3020679eaf.20.1789437619876;
        Mon, 14 Sep 2026 19:00:19 -0700 (PDT)
Received: from [10.81.91.45] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-143659a9a06sm28347650c88.0.2026.09.14.19.00.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 19:00:19 -0700 (PDT)
Message-ID: <22125816-3a33-4df6-9dc5-e45f3c970e1c@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 19:00:18 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: linux-wireless@vger.kernel.org, Johannes Berg <johannes@sipsolutions.net>
Cc: ath10k@lists.infradead.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org, jjohnson@kernel.org
Subject: pull-request: ath-current-20260914
Content-Language: en-US
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDAyNSBTYWx0ZWRfX6iqHZpUc6KXH
 oF41H8ysWju3s50BQnEggttSRdouj5i46jbzE7tzsb+KEW+zGuQ4D+FHjdZ7ORBCoOWY3FyMjmf
 KWKFlR94XtPTWqSJBHPMezVxqOXgRZW4Ji1BbC+YpzHKGh6v88Eo/NQglF6I3EHBPN0KW4u2T1S
 Gp1pb/Eh8DS4xenSp3qFn2e8kMzQ1unhAl3FD1Ledpm0WUxVRrACWw0b8V+agW7u9DQY+7rP1gF
 E3YWKsTMOY6w82HsMx2FLn88vn3ZNpno3rvSyw2Y6oh6zvx9F664Tzd6bhsEayPCPD9VbAjLG5F
 uCSg0MrD8vK3Z9Rl/gJG9QS2wLzEeZ8jak94YuxnYWNOWsn0Jt1V804pJbSMR0VYU/riSwLKo1K
 qPysOuIqWVN5g7IL1gRSZ9aDJsYHtdTnmLU2dpQRfX9oXMSrSt7OQhgF2GVRi3RnXMon9fGuL/U
 F1sK2UTHSG3zU0WtFnw==
X-Proofpoint-GUID: nFlITQFanFhHSy0m31XKJeFW9xiF2hry
X-Authority-Analysis: v=2.4 cv=cqQOAF4i c=1 sm=1 tr=0 ts=6aa8a6b8 cx=c_pps
 a=V4L7fE8DliODT/OoDI2WOg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=hu0l-D-OjZVreMFwxdgA:9 a=QEXdDO2ut3YA:10
 a=WZGXeFmKUf7gPmL3hEjn:22
X-Proofpoint-ORIG-GUID: nFlITQFanFhHSy0m31XKJeFW9xiF2hry
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDAyNSBTYWx0ZWRfX2Y9+odA/DXJR
 W3geEDw3/bERuwRSF8FslSdU+GeX489/h5pT08lPt39JCAU8LkWI3NUMSdn3IawgWyt8VQJMKAh
 W57el2yjrz128H/h0rPkEPeHahHWJSA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_05,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 phishscore=0 priorityscore=1501 malwarescore=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609150025
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_190025_828252_A82679D2 
X-CRM114-Status: UNSURE (   7.58  )
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

The following changes since commit 50d3d79dc0743b616afb00d01a626c76758721f7:

  wifi: mac80211: set up the TX info early to fix failure paths (2026-09-09 14:51:31 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git tags/ath-current-20260914

for you to fetch changes up to 820b8cff81c796ba20573e04722ab62500713f97:

  wifi: ath11k: cleanup arsta in ath11k_mac_peer_cleanup_all() (2026-09-14 11:43:31 -0700)

----------------------------------------------------------------
ath.git update for v7.3-rc4

In ath12k: revert an undocumented and unapproved DT ABI that was added
during the v7.3 merge window.

In wcn36xx and ath11k: fix preexisting object lifetime issues.

----------------------------------------------------------------
Fan Wu (1):
      wifi: wcn36xx: Fix potential use-after-free in TX ack timer teardown

Krzysztof Kozlowski (1):
      wifi: ath12k: ahb: Revert undocumented ABI and dead code

Nicolas Escande (1):
      wifi: ath11k: cleanup arsta in ath11k_mac_peer_cleanup_all()

 drivers/net/wireless/ath/ath11k/mac.c       | 25 ++++++++++----
 drivers/net/wireless/ath/ath12k/wifi7/ahb.c | 51 +----------------------------
 drivers/net/wireless/ath/wcn36xx/dxe.c      |  2 +-
 3 files changed, 20 insertions(+), 58 deletions(-)

