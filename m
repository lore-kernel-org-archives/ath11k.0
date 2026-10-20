Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC763606A325
	for <ath11k@archiver.kernel.org>; Tue, 20 Oct 2026 08:41:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=4P7S2hAS;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=W28KrUrB;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SMcxMjN5
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C0F7Qr64T8vgIgJx6fh5eCdIiZjLiQKaub8Hq/PVVak=; b=4P7S2hASw6pOY9kkqN2HdJRnvr
	DTr++8Mn7xv3jOt045QvvN7R8dI8wPFhfwQF4epD1jHPAaDuwTvZNU4NeHaJAAweZN53Jj4iS0M8s
	l/Mmc9JG6bQwESZo8vwn0FhXKVsKvpH98jOp6rGb4mzOqjwSl8YEO9Dwy9gizvy+w3sI/vEzjebO/
	dE/fFdFm8qpXfNRVAHjieK6PNRkh1Q0oWlsPd3Yl/vc6ex10SEjLMRczle7cC8FgbtZgBJrgWecN0
	ClFGOisBig+bQt3e6OkQOlhfrOQ6DR5sfLnA51XiJ65eFdonXJBOsrKdWLaFtp9uQBluzrj+URJ05
	O/Z35F7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ5Pa-00000009DKP-2R0g;
	Tue, 20 Oct 2026 08:41:34 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ5PY-00000009DJQ-2CYY
	for ath11k@lists.infradead.org;
	Tue, 20 Oct 2026 08:41:33 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69K8PjoG3485589
	for <ath11k@lists.infradead.org>; Tue, 20 Oct 2026 08:41:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	C0F7Qr64T8vgIgJx6fh5eCdIiZjLiQKaub8Hq/PVVak=; b=W28KrUrBKiz4w8Ec
	Rs+OrSmMHWy3N1RcagyI0NJ9E5zW1qEmNDibvU9Je/LU5Ioc77rP0YloMFuRi5aI
	lICjajkqEmIkuIwzhWoDNSpJXduyAquWJc8xfr6iEbqjd8Xr4byC5anHZO8bpBeP
	4NxYWQSnTT2Ecf+U1v4oglp7Jz4AqwvuE54GsrI0AfqW6a/hz+lsiYEw+qC8ob5R
	nIo208S7bKjNKiE3JFp1spVHPnFAEzRECQGhFLPWB6a3G28zKHZ1yqyvInqQIUD6
	OFeZ0HiSzUyy+6wEXL9yQF35wNDghtplmC0e4h5zEjRRfpsMtE14pC+VG+0v/tqC
	odM41Q==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5n1p5u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Tue, 20 Oct 2026 08:41:31 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3ac16335199so3266744a91.1
        for <ath11k@lists.infradead.org>; Tue, 20 Oct 2026 01:41:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792485691; x=1793090491; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=C0F7Qr64T8vgIgJx6fh5eCdIiZjLiQKaub8Hq/PVVak=;
        b=SMcxMjN5BcGIonk+WBFAVDtxLjjaWthEM6uNql9lDPF81F5mWf30wiNqmTnhhVfjtf
         eVOleRABtkuSWZyhRPPL0Y8g3zaGetldRzCGXvvZI9xTHik6bKNVD/W6HC2PAi/5O5NU
         3d/p+ardld959UTXzE4f4BvkymYr0UVZF5tBOoS46Y7N+0Ag4GxjKASR0iftLDtHLKdG
         +V3DCm5G6q7QnTKrw/VlHzbA/Cy2sMsqpjoZ+ogomUDadw+WY9DqeAyRUkUkDX9w6y2v
         lZ12HE9OWAvNjW/GtZKdKciGdeBNj7oxnVOIDdD3unhayzhljQkkJlfo+4fervMEIWS/
         Ie/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792485691; x=1793090491;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=C0F7Qr64T8vgIgJx6fh5eCdIiZjLiQKaub8Hq/PVVak=;
        b=fhQBl38gq5yEXDXVkZrafSvD0rgBNWqCzu7E5HpsrxJex+WgSuvFNeA1q4wVDLVFYB
         4JThZ/VT1O65OwhqlDA7F3wy5xSAI/d1HmM4xWQu/XaoePQUoto4vZsozYdlUuje/Eta
         inB8xhxGZDBo5Ko8AOI6mi1e1XedveKhMG58D7Z8CRJ37KSH/KriJO+9jBq8V8d4cbgB
         h+qFK+oX/HzJRBJrKkAwriIColLhX3s8KtMs3V/2A+jRc3KGVtrVZ4Rs152p02SBMqmB
         Puveo/iBDMgq3YTegWLOjHDYbAQ4Pibj3CINwijOQMES9JpfGWHGYcjzC24vJV9sE9S2
         A6Cw==
X-Gm-Message-State: AFq9FYL04RZosVAn/kmN4wzNXevaI5t15krRst8RknOnRiAQ0wiiNm0A
	DBvvnLfjtenK/aCUSN5AmKwBpm6jRmP6pUd868I9kf42u+6cOBi3LGXXD+0NoflkFGnj6kJgLMD
	VH4Owt/T2fqI9WQG/bDnGTaKoL9AoO91UnFJx/UAXpYWC7ygNZjn3VEY9F6Kz9dPN
X-Gm-Gg: AYBFou2azDFshZMpS5C21c/keldt6S467HxImWaFIQqvOHAp5/za9e9S4qNzgzcgeYh
	F/uri9rBvPgHX+oA/YQjON6/Cd5niFFjCSGqaRG+h45PKXGwbZvGW37Cs1oTkoykU7RQYqD883d
	PNwD+wBf600/utVHMMwS5WDCG+WKAp1nv3OyYl7iehJGcZXgy9tuKYbbDjF2MHM2hZnx8tZJYx3
	T9nsfxwb39MM436R+SsBF4g1QnQbJHzQBuUJPl2X2ReI4EDFrkMjuLWKdnBsCcVk4EsGD/49bMM
	R2ggdxELj2DxUs10WiayKhFjqwa2ptsUVnRU8xsB9ejjsIiPZt20TWbCTYfcyaECZT7WkhsEiYF
	xQ1AWaxCg4m7bpnLAJuUmODX04Qgk62Bc4tlnnksJ+K1YNd4xY4HoDlCiIW1TXNWKNg0/MhRY
X-Received: by 2002:a17:90b:28c5:b0:3ac:4e18:237c with SMTP id 98e67ed59e1d1-3aced87290fmr8764738a91.0.1792485691103;
        Tue, 20 Oct 2026 01:41:31 -0700 (PDT)
X-Received: by 2002:a17:90b:28c5:b0:3ac:4e18:237c with SMTP id 98e67ed59e1d1-3aced87290fmr8764712a91.0.1792485690408;
        Tue, 20 Oct 2026 01:41:30 -0700 (PDT)
Received: from [10.133.33.78] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ad60f8ae57sm2624196a91.12.2026.10.20.01.41.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 01:41:30 -0700 (PDT)
Message-ID: <4f2a06f4-601b-4e96-826b-a5453bc03ec9@oss.qualcomm.com>
Date: Tue, 20 Oct 2026 16:41:26 +0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] wifi: ath12k: fixes to improve MLO station
 stability
To: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
Cc: ath11k@lists.infradead.org, ath12k@lists.infradead.org,
        jjohnson@kernel.org, johannes@sipsolutions.net,
        linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org
References: <aaf175a7-86e0-4da2-a3fc-df87d906f800@oss.qualcomm.com>
 <20261017080444.41177-1-jtornosm@redhat.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261017080444.41177-1-jtornosm@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=aIplOr9m c=1 sm=1 tr=0 ts=6ad7293b cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=k-oXM3pZaSIHxhfxeJQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDAzNCBTYWx0ZWRfX3fSPVqbaKKfB
 VLB6XN6s4t6+zYvo6LeHmrbCSiF6lIEt6TedLzqquVt1OD/hJ3YuGfaksXXPidRAqhX9mACWrFA
 93ayGhioB+GuiPPE37snJZOMCHb3OGk=
X-Proofpoint-GUID: AI6bb4gxap6q-np-yU9z5Aph0lnEsR7J
X-Proofpoint-ORIG-GUID: AI6bb4gxap6q-np-yU9z5Aph0lnEsR7J
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDAzNCBTYWx0ZWRfX9C34ItQ4j66P
 pEN+auh28jKsaiJhk6VBuP1LELTqXioJCjAmYuf32ODKBCokSEG+JqUZd0lXUA1Q+CjiBtA0v09
 3GJnDzXn7CD9ZLt1OQ65qwUlD1Tw93d7uXrkcgMzESwOLEJlqJ1jytTVIbB2M07e6auksXFWi4G
 ukNKjVmiVF3L7vlNqvvNH8GC3R2jpnqkauHVPZHPzrxVR6Wkcru8+/yD2MYzkB2s94n5SRQKJd+
 Uit4zrekK7mZCcBVwF0sskCSPdrffXSgBep/tZfXonz8H9MIEtiLBAigMxfspOylf/e/Z0qGVIG
 c1OL1C3XEd6bLIQVXHj5/HNVjZgGb0ZTGkE1X0evCQRDX4dNWpKp6C13yW7zgVaqgLLc9//Vgsp
 +hZKHbGt2o4Jvoc3VzCLrHvVCOF90h1dEs4KKMTJZdTDfG7RdX7XtG3ddtShnS5u8Xuda7Ka7S4
 6JAbfLbNX3Ex1RSYgjA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 bulkscore=0 suspectscore=0
 spamscore=0 impostorscore=0 phishscore=0 priorityscore=1501 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200034
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261020_014132_561998_1268A41C 
X-CRM114-Status: GOOD (  16.73  )
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



On 10/17/2026 4:04 PM, Jose Ignacio Tornos Martinez wrote:
> Hi Baochen,
> 
> I agree that per-callback guards don't scale well long-term. Johannes
> can comment better because both alternatives need mac80211 changes,
> but let me share my thoughts.
> 
> Option 1 (recovery inside .start()) holds rtnl for ~1.3s, that seems
> too long to hold.
> 
> Option 2 (split ieee80211_restart_hw() into early barrier + deferred
> restart) looks like the right direction. It would benefit any driver
> with async recovery, not just ath12k. But it is a mac80211 core change
> and a bigger effort, and it still needs in_reconfig checks added to
> callbacks that don't have them today (scan, for one), so the guarding
> moves to mac80211 rather than disappearing.
> 
> In the meantime, the crashes this series fixes are real: without it,
> an MLO firmware crash gives NULL derefs and 20+ second recovery. The
> guards here cover the callbacks that actually run during that window,
> not a speculative list.
> 
> I am happy to work on the mac80211 side (option 2), but would it make

Johannes doesn't like option 2, let's forget it now. Instead, are you interested in
(working on) option 1?

> sense for you to land this series as an interim fix while that is
> worked out as a follow-up?

Jeff can make the call.

> 
> Thanks
> 
> Best regards
> José Ignacio
> 


