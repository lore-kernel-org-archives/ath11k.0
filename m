Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84887C36014
	for <ath11k@archiver.kernel.org>; Mon, 31 Mar 2025 21:47:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NS2zcXptxcgcU0tPvmrUCO30qFIX1zPhS7qEmUqi3zU=; b=38F82izt/IFUeRYM2W1VAKjLib
	Q+dSsYgFg4suoxZfp6UsehrkNpyI/rwIVbh7nlil0Ge0kUu7jPDEEJ527+1Hvi+yaBYVlda2zsqkc
	hkTr2XtXjg8SeBRKn5ul4iv62NOvqPIE0KItBe2c4d96TBgzT0EA3aiLNqmlOK6mmr4hiMGwAmasO
	Pgx0u7FyukjrZmkOK+A4b3tpCTx+yykG9yWn/iBBGWaHjhKV/EyF6msG1ZusS7ED+KcEMOuT3a4ch
	SDuK7FZ57ZfRTZXB6bkoVpxRGKPoj5grVdmXxbaxxlg2sLhl9VriAW8+ffHXJxqZpUdJrilukGnGU
	xzwlCCwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzMyH-00000001Rt4-1Hkf;
	Mon, 31 Mar 2025 21:47:05 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzMyE-00000001RsZ-2gtL
	for ath11k@lists.infradead.org;
	Mon, 31 Mar 2025 21:47:04 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52VFCvx1026716
	for <ath11k@lists.infradead.org>; Mon, 31 Mar 2025 21:47:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NS2zcXptxcgcU0tPvmrUCO30qFIX1zPhS7qEmUqi3zU=; b=GXeqDmldmketFn1n
	5ygpr8H2o8Lt2ywjHkHaf4PWtDpwiIavmK31LWe9vNRtgKJF7i5k1BamQb+L7CtW
	F17QVAxNjHNJYwaCRYRxwcXBJB5vZhqgyAMYqry7xpGTcBQruPCXNLtl3KJOX+ci
	ddKbaX+fUnUnLOdGYR5hZow7t6n8lsmFXKPT8saDkC4oE7Ls1ExXlgswTVCeWguQ
	WfuXVMmHaVO0S5rV3ENbtL07FMzc3XXEI5lzEmqRDReh6lieNhxt8Iu0ucAIbdz6
	Jn6sg+ySihX30vBNtRK+jGlOY6Lf5sTYfERIHH+WTRRts97rXrzqxnFlk1xsuMKa
	c1OO9g==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45p7v8dstx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Mon, 31 Mar 2025 21:47:00 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2254e0b4b85so83977465ad.0
        for <ath11k@lists.infradead.org>; Mon, 31 Mar 2025 14:47:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743457619; x=1744062419;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NS2zcXptxcgcU0tPvmrUCO30qFIX1zPhS7qEmUqi3zU=;
        b=OLf54OdO39hGaCr1nTMmnS9fwHVM0RCifnKwPqML0ebV0iFlSwyJ+Fk5AYTjhDeGzO
         0hlfTyRd7ADqQj0ojonlJzYlp2zK9G7xKcN+PNxT/4trDNqP8wJSDf/3TKFNAYXwP6yu
         Oe5vq7YzcUAW2wb1CqXPfYiPtzwObNAiGa/jcTEZU6Dvs/u4l5N/Me1MvZKLXCGoZr+f
         3XZDZe8kJSXtB30VAoUY8hn6lkmjezMEpxSASwNUskUkByBboUNU6eqgtKihSpzn8+7i
         +T4SjIRXtMCrCAuCt9iy8fB0pvT32aqfDcr8Fggi7uEr/kW212F5pAm/3BqoY73Vf+jL
         pbhg==
X-Forwarded-Encrypted: i=1; AJvYcCXRf+rIniqK2tKr/LiI5QfjKkFGWko2IydpVSury7rPpENHJk3RgRywYP8bFn0Y2eYW6taIr4M=@lists.infradead.org
X-Gm-Message-State: AOJu0YzbTXeeAX6U4LYitAYsqHNScnZ9Xp9QQeeUWTYf6bVZerNUybcw
	YVMg1H3XevM0LlUnC4QuqqQXP/e6olpni/Pkln9WMKIXucVXaMMys/irrqKWs/uZ5mirNdy6von
	7V/TB6oPtGuowogC4OGfAMZWgIewF8b6FPu9RtIPUZNYUFvBpZVPVQq6DOPjA
X-Gm-Gg: ASbGncsUMp5vJHYfBRXYqIj5WmlilKaYDGMCG5rg5BAQIBaMQmgjKisryOBwmT0llpd
	omN9pkIQ3erIOWAnrF6gWAAnkGng8GM6CKNLjVvY330/5fkgxLXuFKtRkkm+oau9BHMuxwR6C0j
	a9SOn6ubP5j37R0Z1RIhMzNM40O2SWYNGUewEbEvUXRvxDjgwlUEg4XTOjc9PMQp1aZ09WGKbuc
	E8J0SB1urkN2u3jDm//gyWs3GLt53NB7hIc5x2XlVdLqVjLvVXnpYetTEeXZtcoqCFQF+pxnZRj
	/RntoYTt6RvMN8Cu6YLHNa8gzTHxqTV2oo/0F799pzInZOwPfKj8
X-Received: by 2002:a17:903:98b:b0:224:7a4:b31 with SMTP id d9443c01a7336-2292ee06c99mr163911515ad.6.1743457619400;
        Mon, 31 Mar 2025 14:46:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFtOEsVjvWiGJctpJPUZiJwd6njJX7AeXk869duUJ/FtkKLtpSuBHJ8GhZpYHgaGaLnzk8gTg==
X-Received: by 2002:a17:903:98b:b0:224:7a4:b31 with SMTP id d9443c01a7336-2292ee06c99mr163911265ad.6.1743457618981;
        Mon, 31 Mar 2025 14:46:58 -0700 (PDT)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2291f1f7dcdsm74092055ad.216.2025.03.31.14.46.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Mar 2025 14:46:58 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: Johannes Berg <johannes@sipsolutions.net>,
        Jeff Johnson <jjohnson@kernel.org>,
        Baochen Qiang <quic_bqiang@quicinc.com>
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Muhammad Usama Anjum <usama.anjum@collabora.com>,
        Takashi Iwai <tiwai@suse.de>
In-Reply-To: <20250328-ath11k-bring-hibernation-back-v3-0-23405ae23431@quicinc.com>
References: <20250328-ath11k-bring-hibernation-back-v3-0-23405ae23431@quicinc.com>
Subject: Re: [PATCH ath-next v3 0/6] wifi: ath11k: bring hibernation
 support back
Message-Id: <174345761819.1161294.6011866628558951179.b4-ty@oss.qualcomm.com>
Date: Mon, 31 Mar 2025 14:46:58 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.0
X-Proofpoint-ORIG-GUID: IEtjkg6z3PbXp8bj7LfqVvZw8cxOGjr-
X-Authority-Analysis: v=2.4 cv=fdaty1QF c=1 sm=1 tr=0 ts=67eb0d54 cx=c_pps a=cmESyDAEBpBGqyK7t0alAg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=EUspDBNiAAAA:8 a=EgwDjV4hzmH0pz7qutYA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: IEtjkg6z3PbXp8bj7LfqVvZw8cxOGjr-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-31_10,2025-03-27_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 bulkscore=0
 malwarescore=0 suspectscore=0 spamscore=0 impostorscore=0
 priorityscore=1501 mlxscore=0 mlxlogscore=843 clxscore=1015 adultscore=0
 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503310149
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250331_144702_823508_294A817B 
X-CRM114-Status: GOOD (  12.73  )
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


On Fri, 28 Mar 2025 13:32:23 +0800, Baochen Qiang wrote:
> To handle the Lenovo unexpected wakeup issue [1], previously we revert
> commit 166a490f59ac ("wifi: ath11k: support hibernation"). However we
> need to bring it back, of course with additional changes such that Lenovo
> machines would not break.
> 
> For suspend (S3), as those machines work well in WoWLAN mode, the thought
> here is that we put WLAN target into WoWLAN mode on those machines while
> into non-WoWLAN mode (which is done in the reverted commit) on other
> machines. This requires us to identify Lenovo machines from others. For
> that purpose, read machine info from DMI interface, match it against all
> known affected machines. If there is a match, choose WoWLAN suspend mode,
> else choose non-WoWLAN mode. This is done in patches [1 - 4/6]
> 
> [...]

Applied, thanks!

[1/6] wifi: ath11k: determine PM policy based on machine model
      commit: ce8669a27016354dfa8bf3c954255cb9f3583bae
[2/6] wifi: ath11k: introduce ath11k_core_continue_suspend_resume()
      commit: 3d2ce6ad9126b96a721542c6299a2f0967b5a63f
[3/6] wifi: ath11k: refactor ath11k_core_suspend/_resume()
      commit: 662cc5b92c327e94587a959d7ed75862eda4b059
[4/6] wifi: ath11k: support non-WoWLAN mode suspend as well
      commit: 88fd03cf51a7d67dac976ecce079ccfc79376966
[5/6] wifi: ath11k: choose default PM policy for hibernation
      commit: 32d93b51bc7e2e557771abe4a88da69c609e3d52
[6/6] Reapply "wifi: ath11k: restore country code during resume"
      commit: 3b199a58cc585f423a85af2e57045c9a783361bb

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


