Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F13B606A33B
	for <ath11k@archiver.kernel.org>; Tue, 20 Oct 2026 08:37:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=HyIkxI31;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=IccQvnrD;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dWxcIcIU
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HU9tUCUqcsJLWDgkm2AupVOmJfSMkAhKvtmhAPSm/00=; b=HyIkxI31zEFVgztKuEermFOFdj
	WCjx0DNBFQoHCyRyHGr5hWxytNSv42GzI8zPBPbdohYR4l+4z1pgq7DFS1Q/SK0hQ68TNHnpgHTQt
	Z/Z8wFzljNFJy/iN/iJBtwOaMRausgyimEnQDbLfktakcS+BPAs4zj+dGY9QWZqTJ5YD8iHH31qTd
	d7RjfOaXLIt1ktd79HnBxc2ZSpwNu4z5y64/yX12SoJWV51LC7uwqQ+hD4vHRBFlmXollFM5URlw5
	apAFWLgundYSX5CO7nSUwNNzcHSWdLp3wE0U4ViippwX+XGB9M0O3V1WjWIbNaiJZoiMXWcsGNC4r
	fN5BBEDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ5Li-00000009CTc-3VAh;
	Tue, 20 Oct 2026 08:37:34 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ5Lh-00000009CSt-01ky
	for ath11k@lists.infradead.org;
	Tue, 20 Oct 2026 08:37:34 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69K83rJG185780
	for <ath11k@lists.infradead.org>; Tue, 20 Oct 2026 08:37:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HU9tUCUqcsJLWDgkm2AupVOmJfSMkAhKvtmhAPSm/00=; b=IccQvnrD6BnBFmAv
	OG60Wr78t3cKbAbIa70H9REzsYKxbflhpbYPcYj2NXSmANT+2GbiA8gcdkYvkLTD
	mzZOwcG+Rmd2GgwbreXe7YGOz2X9Vd7Ic9pXvzb+l8056Bb6VnE1Bc42i9JiaKjM
	SMKkjiZ/Uwa73vkcB1vH6L1avb5WIwAkJKM0rkvUcI5QUpPR+drQT+YF9jIAA7dO
	hrGUCDG87meXIBQOkm+ezdVCPYCLq2+W+lCRTA7AeOTMUfQVYkFbKTCLLUAzG/bL
	sYQymqQg/PoXWMq8f1Eik+m81hxypCrOdwqDOg/dkBc+94I4H5yytLu+WvatLzY4
	AGOVOA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5nsnk7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Tue, 20 Oct 2026 08:37:31 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cd65285537aso1290706a12.1
        for <ath11k@lists.infradead.org>; Tue, 20 Oct 2026 01:37:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792485451; x=1793090251; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=HU9tUCUqcsJLWDgkm2AupVOmJfSMkAhKvtmhAPSm/00=;
        b=dWxcIcIUOwgh/NrsrvT0aXBgEAYAP2VIys84279hkvM+fyN12VStbPOP+y4ugkQW6M
         nVNGtbRfVf8F9BovXDHrUbftyU3gQwGossKpKrRCHUuxq/+1oQ/gaEMnnw8Nk9dczDLR
         hBXXFYA52IdT5vTGQNEfT47iXj7697MqZXJmbR1/PRokqcfHc4jbtknNkGf6Izjjo2gB
         g98sbwwWBBsUKMecbcaotkuli9oGVsvnnig5ASxfQzI30F/eds9sEFYftpvXHH2wj0pu
         Iw46N4GhlvzE/wJqCRpMAt4GCkzaLl3BzxRXvg12SoHJQX+riApuuSErzmSwsWbwznkR
         tQHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792485451; x=1793090251;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HU9tUCUqcsJLWDgkm2AupVOmJfSMkAhKvtmhAPSm/00=;
        b=fprpurxHFZp2zGlskwwTikTcapLEWSBR5LEayP1DPe0z9SGJisCRjPgHPHhrBsmptJ
         eDLWsmgTFfAifoNgi6Rmha1UQr+sAzQihU1sxOnHblhQD1C80WstVtXYznnyPMLDAzlx
         mxjudo97WpqDHueq/L9hrRU2A6VWCJq1eWqIQMfx/jGKdcg+iw4s2hpzxaiAjDkkXNNp
         PCo9dlevzMj6bhJCimgDDpwgIfmCTeEH5vf994WJj3vd/de7JXBU+hv+Z/zJq7rHKBAV
         zWpXOqU2BM7v0WkcyrIQtyO9nw4oQ8Tpve9ekjBNIxx8FD5iRS1scyvVZ34CBb/MOVOS
         wCtg==
X-Gm-Message-State: AFq9FYJG8ptIxcq9f9JAGXG21zQ7VpVsCE8yjmv3HhnsTIen/AOBeK2O
	mZbdrpUCcySBg5UOeVPcrK+mhf98S2Yspc53CNBtA+YPlXMOkn3U1Yfz2qsYZxv3S7TkGNaiR14
	g7H12PoZ4eTf4ky2sjkjWAhRR3vbiHIUf4q7jdF7DuTdQhUbLYesVTZinX9liZkf0
X-Gm-Gg: AYBFou0Bq/uJHYlp63SAHJGDbpJbsGzrEMYTJF37VGii/IzU40tScB2WL7Hi+Lo7kh+
	7LZXVWhR4isByjDYHazcGfdPz02HS4xmgWTLeORvY9zsl69u7UJMVghllqN//GHZatKrYxVlTxQ
	+88FONRRyN/mE1kTrmXHQJ0Myay8yHn47o3IjDFhvxbjCy2/4HhqkwPMISNYmHKoCUgs3rZifeI
	QF1O2p4Z0c5GT6Vr+jzbKqNMXKWZqE34HzOhKzMMT94l+k0cniBlPTf9JS3Boumw+Mu0eFtJD9E
	UPXe9vOr04Lp2GamqGj2KbGLCQMNlkc1k2td7Pkiy+qO2PkdZtAQMfl7xMY+4uP6R7QlJ4K1iy4
	VogMgGjjLKZTEbAr2z4eEWUoeJFgQbWoZAHeIkgVzI1H/g2pZygpbUL7H5Ys69TT+Rej7JEOS
X-Received: by 2002:a17:903:2290:b0:2e9:3dd2:a904 with SMTP id d9443c01a7336-2e9a69f724emr81145745ad.16.1792485450990;
        Tue, 20 Oct 2026 01:37:30 -0700 (PDT)
X-Received: by 2002:a17:903:2290:b0:2e9:3dd2:a904 with SMTP id d9443c01a7336-2e9a69f724emr81145625ad.16.1792485450488;
        Tue, 20 Oct 2026 01:37:30 -0700 (PDT)
Received: from [10.133.33.78] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea15019084sm9823665ad.41.2026.10.20.01.37.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 01:37:30 -0700 (PDT)
Message-ID: <f0c329ad-a13e-4bd3-b630-c0137a5f42c9@oss.qualcomm.com>
Date: Tue, 20 Oct 2026 16:37:26 +0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] wifi: ath12k: fix MLO station firmware crash
 recovery
To: Johannes Berg <johannes@sipsolutions.net>,
        Jose Ignacio Tornos Martinez <jtornosm@redhat.com>,
        jjohnson@kernel.org
Cc: ath11k@lists.infradead.org, ath12k@lists.infradead.org,
        linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260804175004.1761075-1-jtornosm@redhat.com>
 <20260804175004.1761075-2-jtornosm@redhat.com>
 <aaf175a7-86e0-4da2-a3fc-df87d906f800@oss.qualcomm.com>
 <1c8bd087a5cfd54fbe2825f2fa19a7851357ba86.camel@sipsolutions.net>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <1c8bd087a5cfd54fbe2825f2fa19a7851357ba86.camel@sipsolutions.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 5U0JErUq-qjD7ed35w-b6I2M29ugB7Pm
X-Authority-Analysis: v=2.4 cv=DZOCOftW c=1 sm=1 tr=0 ts=6ad7284b cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=j4zPaZQj4CSWEhlzwlkA:9 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: 5U0JErUq-qjD7ed35w-b6I2M29ugB7Pm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDAzNCBTYWx0ZWRfX+iuvL3eH9yhv
 GVYNZ/mmazgHj9riyfwgPNJ+GCg+5I3eoWu6rW+YtJSc+F1kVEYHg3hXjETnv4Cqj5ywWV+KNTW
 VFjFAnHLvZY84PQvg5zF0lF4UAi8zHKtqKwoCw5y6iogx4vf+PYKaWun7FcHCpiNQ3uoTK0zZVo
 oG6SMzknTXgmY/ULS+vKUHNPlt3wh/Glogr0xyrECs+7YP+c7Z2y69q/gndDykQTkEQyV740HBz
 X0NfFgRhXQIUnD60iMUUE8pKEjwslcmk4MzRJpJOlssM/mxQD7aVy9Kb4SOhGipobDz1J+eh1u9
 d02jcjDQwKRXIXWdtr845kJAaA1bGtTZSHiKJMXtoXtIaLxGhDLowzmlyhtX7kSuQZagHZiuO8O
 b/3n+/+o5uc/272OsGgJzdhbbzsYboTAXDdYyajjgM+DZxYCbbVO931Xj7UMlvkRsxBNcSxClFC
 p/c08EYv62CfTmOhxEg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDAzNCBTYWx0ZWRfXxWMjZtdhKTgj
 DCfUYdg9/UJJp6GRko+eiEAK6WK23wogl6prmqEUL+/MDNI7NL1Bj17/9PrtaEB7vrPLUzVXkLG
 urZOvvh7kcxPhB3dp/QGZlFZpLrFnFc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 phishscore=0 priorityscore=1501 bulkscore=0
 adultscore=0 lowpriorityscore=0 spamscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200034
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261020_013733_056732_297C748E 
X-CRM114-Status: GOOD (  29.24  )
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
X-Spam-Status: No, score=-7.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 10/17/2026 5:33 PM, Johannes Berg wrote:
> On Thu, 2026-10-15 at 13:51 +0800, Baochen Qiang wrote:
>> I don't think patches 1 and 2 are the right approach. Guarding every callback that can run
>> during recovery with a RECOVERY/CRASH_FLUSH check doesn't scale, whatever callback we
>> forget today is the next crash report. Besides, such guards don't help those in-flight ops.
> 
> So I can relate to that, but ...
> 
>> The trouble is I can't see a clean driver-only fix. The driver knows the device is gone at
>> crash-detect, but it has no way to tell mac80211 to hold off until it calls restart_hw().
>> in_reconfig would do exactly what I want, but it's only raised inside restart_hw(), which
>> is far too late for a device like this - by the time it goes up we've already taken the ops.
> 
> mac80211 has the same problem? How would *it* hold off rather than
> annotating every callback from userspace, debugfs, ethtool, sysfs, and
> the rest of the kernel with checks? *Maybe* at the boundary _to_ the
> driver, but that's bigger than the boundary every individual driver
> has...
> 
>> 1. Do the whole recovery inside the restart path, i.e. move the whole thing including
>> state reset, power cycle and firmware reload into the driver's .start() reached from
>> ieee80211_reconfig(). Then it all runs with the wiphy lock held and in_reconfig already
>> set, so the sync is free and no new API is needed. The downside is we'd be holding rtnl
>> for ~1.3s, which I don't think you'll like.
> 
> This is what iwlwifi does, but it doesn't take *nearly* as long. :)
> 
> There might be a chance to disentangle the RTNL from this given the work
> I did recently on disentangling it from cfg80211, but then on recovery
> *failure* we have a problem with cfg80211_shutdown_all_interfaces().

Hmm, I wonder whether the restart work could take rtnl only around
cfg80211_shutdown_all_interfaces(). From a quick look,
ieee80211_reconfig() itself mostly only needs the wiphy mutex, except
ieee80211_add_virtual_monitor(), which asserts RTNL. Though any rtnl holder that then
needs this wiphy would still end up stalling everyone while the recovery runs.

> 
>> 2. Let the driver raise the barrier early, right after crash is detected, e.g. split
>> ieee80211_restart_hw() into two parts behind separate APIs: the first stops queues and
>> sets in_reconfig, the second just queues the restart work. That way ath12k can do the
>> time-consuming part outside the rtnl lock while staying in sync with mac80211. This would
>> also need a few op entry points that don't currently check in_reconfig (the scan entry,
>> for one) to be filled in, otherwise raising it early doesn't actually fence those ops.
>>
>> Does either of these look right to you, or is there a direction I'm missing?
> 
> See above - I don't see how we'd really implement the latter reliably in
> mac80211? Sure, we have a bunch of in_reconfig checks, but ... I
> wouldn't really trust them and I'm not sure we can guarantee them given
> the surface area.

Fair enough, I agree. Looking at it again, option 2 would just move the
per-callback checks from the driver into mac80211, with an even bigger
surface to cover, so it doesn't really solve anything. Let's drop it.

> 
> johannes


