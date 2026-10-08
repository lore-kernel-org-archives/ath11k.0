Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12CC8CA600B
	for <ath11k@archiver.kernel.org>; Thu,  8 Oct 2026 11:02:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6YHQnEULCZieeaLxdgJmpoPCPlP2is0QYfWrbkAwUvY=; b=NUZ2GW5X3mlOLsPVkc7i+Hi14G
	XHc6QYxO0uOVpw1BrWIJCWD8leUTWOA3zLnqQwllv6BselG8/1bmKdAONnl2kBe86nG04ub9pbukJ
	VmvHMqQ12mFFhAG+dpjCGB8vbcXHJ9G6/M4jz0YT5v2OC4KnMF72yg/p9usJpdo2264/S4u0xyrL7
	kTmPtMypn3OIqPOwu/N3olsgIdOS6wrS/tB1Sm02c38yMLRgfZx+hccsyJ1USmeUyHTdPlMhqWHr6
	B/0GCzcVPJW9HA4w4gjpz5C/IYmSMSlXZ75N+CXgWcxuxZEzD+6cOESX8d6LAF2yY7hiVmEb+Xo3g
	YqBclxvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEltg-00000004D1Z-48fa;
	Thu, 08 Oct 2026 11:02:49 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xElte-00000004D0z-27N4
	for ath11k@lists.infradead.org;
	Thu, 08 Oct 2026 11:02:47 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 698AbQlC2289877
	for <ath11k@lists.infradead.org>; Thu, 8 Oct 2026 11:02:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6YHQnEULCZieeaLxdgJmpoPCPlP2is0QYfWrbkAwUvY=; b=GJd8CGRMdgEPoDTA
	LcP5RdfpB7vD55+ZKGi7XWh7XfLoB1+NYKrSHuCRAyjhSULl4WUcjkK17UlXFf2B
	gibqAYi+wkhvphiQKCRIxPkHSZLveoO24La6gemjemAL6mOIghc90zS/VG7hZ92X
	Ru0ER0/CjkXNl7x5t7ZG9JIIPX/n2JVu8lalUAvNZqnnGoltR8M7cOrgqaQSnP4Z
	Gyz1yTNQTKOtz8ubKUsIRv1NEZgCj0rvs9fp5JVbsx8H8mvyibaENEveJo2k7yee
	xvxmYhG4eybbG6E9IGhEYOv/m9r9k+1xKqdN4CUjulNVkakb9cdLOvTCVtff8Pf+
	ilZrUw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe3jp2s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Thu, 08 Oct 2026 11:02:44 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2db8e9fe9c7so53218395ad.0
        for <ath11k@lists.infradead.org>; Thu, 08 Oct 2026 04:02:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791457364; x=1792062164; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6YHQnEULCZieeaLxdgJmpoPCPlP2is0QYfWrbkAwUvY=;
        b=VAQFik5a5M7B6A+eWKy5GJOeM4zDnOpV+fT2VBGIH7uogSKf7hNUevzTr77EowWwQo
         AwBJRlSSr4RgDdQ0SBqkzlxfx/uIGbv60epTV6n6oQyWDrGKCYTLq5mlzd7qJybDDnfT
         W4at+pYSWAuoHW9u/WTac7+0idT8jqAxO90fuwZDXrcZSdReRRXxZRxcqN7VSrFCffEJ
         1X9dJWaLHbM1s+0EWcoZWC7Hp7Uf6jB2zDs9SK9KvWvTQuhR1bbXkODaWfOzlIkDc6YD
         bXek37XR852DRkXXpjG1UPrwR3zJg5rwicJqUb6KP95DQa5EjGn2AVCdMAMNkMytpiLF
         /juw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791457364; x=1792062164;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6YHQnEULCZieeaLxdgJmpoPCPlP2is0QYfWrbkAwUvY=;
        b=hsehK25T94If4lXrMksydWR6sjtRnSaUkKlWDSYzg4m42uyNkG6MBpJ5ctkdyNf4Q/
         y1VtCnA2bB7CLsu+ntRbJ1twl40O/f1xxp8vLTMpFb9Fjrh/l5qCV/gt3HNr/0IckSPG
         KuWEr56BMH4xHv7jIJQh66SO4nc4yFb0kznJKuwO8L6Qhxp53D6mqlBWWqoBZgsEuRZb
         4WdxuGmrXeYxOAtRvA9Eqo0ekFRlLID8dH2iwmURTdljIElW2j+OZGCataTxRHi0PdqB
         xnSgt4IOhrDOQJzGQdYK5HprkG76QALpCUiZv27LhK+PaCO0/6TjzzuMoxHvHGoafRiq
         T0iQ==
X-Forwarded-Encrypted: i=1; AKwUvBykHZPYr2Rs0qpKJGWz8b+N4LogUYIbVBxH0hbEyVW/Czxxsp+mBEUTJE1GAlO3YhCOw9SwOmM=@lists.infradead.org
X-Gm-Message-State: AFq9FYKJsixYkp+2o1w2z73LKGSLYgGuqYiq6bJPImsVoJ5FN6HrYVKn
	W6lid4v8ezggeL1drdCp2cfswTDh4ZFzN8OXlARrqNY6wK0DTbMJXYzzhQQX5sgav3weRCMPLo2
	+SmvdoojauX/7kN2oKbpEmJfSoth6ujP7NH23A0XVW2JiQ7uARDGH//CgBlrUnkF8
X-Gm-Gg: AYBFou3DGX41zINjPzfnI6cxxPWavtUizLs2lbw3/3gjv62PBGHUnp7JWjQZpZLPO6d
	iZ4hXjfkEukna1U4JUKWO3Mex4iTZJqT9FY6o4Fu+svkJLq5cVTtgWID9PJhiwOXnIURG03EYC+
	npzfmTXOJssZRJMza8YD4lM/8ITF8eB5vO48zEk0X4CkemEb53tjcMKYz8AxzJiRkJLJNx91c9p
	CYOx0FWuL9eHq34bMW7vsdjvFfpz38AtIGaUxflUqIZuG7Rs7irtoPIrSJwJls7rkvJwrBbAh7P
	CQWpMEaazPqhssygoAPjij30rxXq8O5JWeRU71ZgrLmLZxI0Pwv2B5TyFWAGulYebIf//JGAfhm
	PPsNQJDRZfau/GmQspNjQI4BSnz5VQkTqqywuFb4ijOP9f+56jeWja5xwk2ZElNYqgsZoEao=
X-Received: by 2002:a17:903:2c8:b0:2dd:c053:9c70 with SMTP id d9443c01a7336-2e6004f2a86mr45269575ad.38.1791457363536;
        Thu, 08 Oct 2026 04:02:43 -0700 (PDT)
X-Received: by 2002:a17:903:2c8:b0:2dd:c053:9c70 with SMTP id d9443c01a7336-2e6004f2a86mr45269055ad.38.1791457362639;
        Thu, 08 Oct 2026 04:02:42 -0700 (PDT)
Received: from [10.133.33.26] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e604437bb7sm22753685ad.1.2026.10.08.04.02.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Oct 2026 04:02:42 -0700 (PDT)
Message-ID: <c3564de9-c228-429e-8e04-3ff65619d1fc@oss.qualcomm.com>
Date: Thu, 8 Oct 2026 19:02:38 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] wifi: ath11k: release peer accounting on peer delete
 timeout
To: Michael Pfeifroth <micpf@westermo.com>, Jeff Johnson <jjohnson@kernel.org>
Cc: Kalle Valo <kvalo@kernel.org>, ath11k@lists.infradead.org,
        linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org
References: <arJzxQcf4intXBqS@mpf-ESPRIMO-P9012>
 <9d8307ee-e9bd-4538-92f8-b33410caecae@oss.qualcomm.com>
 <arTp/9A0iMNpIhl2@mpf-ESPRIMO-P9012>
 <8bc3eaa1-7233-48db-a41b-ce3f08fbdd15@oss.qualcomm.com>
 <ar0LVqHZF8UlRB0o@mpf-ESPRIMO-P9012>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <ar0LVqHZF8UlRB0o@mpf-ESPRIMO-P9012>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDA0MyBTYWx0ZWRfX8/Pqmqiv+xWn
 6ibcbfdXURcI+cG9uyJ7hgAiIICbxKwSkatQq6tYGhmRwo+bccwltD5wW08VKdWJR+hDBsu7T32
 OgmJ3m8lM7hHM9SxsgtmXgYzT4dcN4U=
X-Proofpoint-ORIG-GUID: 20AnXUjFi1qXQUrzLDvsoO3JWOyIUSca
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDA0MyBTYWx0ZWRfX5dE0d0xEE2Il
 VDh1lO34MRfMgdAeYdZ1UF9U9aE5nZbC1K2zqS1PigANK9w/pkVDpP9lFilvCJ5GO9dlrNI6ItB
 bR/QENp8h+O4oVHSV4Vv/It/QG6Tmx8pX7o9SG9pvaamI+K4wQ6UNvfS067/cMq9ISi21UBDhlf
 YbKxCopDKOFIHVwpzI4pxTpSP/7zNs2axwNVxoyJ9W05mdePCrL9z7J/ZwIkDofNoLluLv7qBB0
 GJ7BBxPbcwnK6dPbKjhudGf8XvkbMPvLqaVdpCinCQatAf7VhnIs0DJuL6d4S5/C+Hixyfcd1Be
 MXo5Y1A6qK7pCJcY8IrB1VlXlg1kW1ZeIDvc6T5YjU4ZBdDiUbHQ0IdPITfBMKn4jidIsDcq3gR
 6wLHTao62Zf2+fE/mDQIi1PWH8F06KC9xyL5zCdTPQBuThdLWr2UCOrW51DSh0jqWzkDoa7O/pZ
 5MlJul/nSTQ5/j7D9Kg==
X-Authority-Analysis: v=2.4 cv=IIuXmQvG c=1 sm=1 tr=0 ts=6ac77854 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=N9GNhs4bAAAA:8 a=URxyR80WDTEKk2XSxLwA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22 a=PZhj9NlD-CKO8hVp7yCs:22
X-Proofpoint-GUID: 20AnXUjFi1qXQUrzLDvsoO3JWOyIUSca
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_04,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 malwarescore=0 suspectscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080043
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261008_040246_665631_83F5A276 
X-CRM114-Status: GOOD (  29.45  )
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



On 9/30/2026 9:15 PM, Michael Pfeifroth wrote:
> ath11k_peer_delete() only decrements ar->num_peers when
> __ath11k_peer_delete() returns 0. On a peer-delete-confirmation timeout
> __ath11k_peer_delete() returns -ETIMEDOUT, so the decrement is skipped
> and one ar->num_peers slot is leaked. Once enough slots have leaked the
> ar->num_peers > (ar->max_num_peers - 1) gate in ath11k_peer_create()
> rejects every new station with "insufficient peer entry resource in
> firmware", and the AP stops accepting associations until the radio is
> restarted with a wifi down/up.
> 
> This was observed in the field on an AP after hours of uptime with
> frequent roaming and reconnects: clients could no longer associate even
> though the firmware peer table was not actually exhausted, only the
> host-side ar->num_peers accounting had leaked.
> 
> The delete-confirmation timeout itself is otherwise harmless. The host
> first waits for the peer unmap event in ath11k_wait_for_peer_deleted(),
> so by the time the delete-response completion times out the peer has
> already been removed from ab->peers and freed by
> ath11k_peer_unmap_event(). Only the ar->num_peers counter is left
> inconsistent.
> 
> The timeout is reached when the peer unmap event arrives but the peer
> delete response is missed, e.g. because the response event is dropped in
> ath11k_peer_delete_resp_event() on an unresolved vdev id (logged as
> "invalid vdev id in peer delete resp ev"). Do not treat the delete
> confirmation timeout as fatal so that ath11k_peer_delete() releases the
> ar->num_peers slot instead of leaking it.
> 
> Fixes: 690ace20ff79 ("ath11k: peer delete synchronization with firmware")
> Cc: stable@vger.kernel.org
> Signed-off-by: Michael Pfeifroth <micpf@westermo.com>
> ---
> v3:
>  - Drop the defensive peer list_del()/kfree() branch; it is dead code
>    since the peer is already freed via the unmap event or on recovery
>    (Baochen Qiang), leaving a minimal fix that just ignores the delete
>    timeout.
>  - Reframe the commit message around the field-observed num_peers leak
>    and the resulting station association failures.
> v2:
>  - Correct the root-cause description and switch to netdev comment style.
>  drivers/net/wireless/ath/ath11k/peer.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath11k/peer.c b/drivers/net/wireless/ath/ath11k/peer.c
> index b30a906..f573a2c 100644
> --- a/drivers/net/wireless/ath/ath11k/peer.c
> +++ b/drivers/net/wireless/ath/ath11k/peer.c
> @@ -340,9 +340,10 @@ static int __ath11k_peer_delete(struct ath11k *ar, u32 vdev_id, const u8 *addr)
>  		return ret;
>  	}
>  
> -	ret = ath11k_wait_for_peer_delete_done(ar, vdev_id, addr);
> -	if (ret)
> -		return ret;
> +	/* Ignore the return value: the peer is already freed, only its
> +	 * ar->num_peers slot would otherwise leak on a delete timeout.
> +	 */
> +	ath11k_wait_for_peer_delete_done(ar, vdev_id, addr);

as stated in the commit message, the purpose is to ease the case where firmware peer table
is not exhausted but host's table is, however the change here is to ignore the return
value by default, regardless of whether firmware peer table has free slots. So what about
ath11k_wait_for_peer_delete_done() timeouts due to firmware peer table exhaustion in fact?

More importantly, host rejects new peer association only after the

ar->num_peers > (ar->max_num_peers - 1)

But if we really hit it, I would suspect something wrong with firmware. So even if we give
it one more chance I don't think we can survive in the end.

>  
>  	return 0;
>  }


