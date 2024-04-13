Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2059AC4345F
	for <ath11k@archiver.kernel.org>; Sun, 14 Apr 2024 00:03:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Subject:To:From:Message-ID:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=lxSTh46eS6wiYr6UM14IUEbWRxI2sgGCEKGFAUB+uVk=; b=M3/FDpWBX8FgJ99S/sdX3ihaJz
	UGlEgXymPUFOPfUWotvWz4HZFxqoz5G3AeaiBF3A0YEydfGg1Df+xw9BZRynAf8Zv7hNaeSMe9HEa
	OIj1XhKLhHi/iVYbN9TONQCc4X9M9kBt6pruk8kbh6DBUtUKRj80kg9HCIh4Xg6vXXvh+epyGK0fi
	eTfuUUKqfNk2XlL+8iW3lN9pJZ/cIB3vSa+IVYNbZLC+lSL8cW4hk95QSFwF4TCYBGYtnZc4eIEAb
	MBhJpeNkdl5K7Y5QHjxWmvAg07MwaZLInsPmdQrBBQa8vStur9hBLHLzfgrBvDt0tkhw0KBMPBzoD
	GdgFQMfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvnKs-00000004EO3-1Kn6;
	Sun, 14 Apr 2024 00:03:06 +0000
Received: from v160-251-215-124.kpp1.static.cnode.jp ([2400:8500:2002:3179:160:251:215:124] helo=vm-805d5b38-61.novalocal)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvnKn-00000004EMw-2745
	for ath11k@lists.infradead.org;
	Sun, 14 Apr 2024 00:03:03 +0000
Received: from xdgzvrbhk (unknown [64.176.47.47])
	by vm-805d5b38-61.novalocal (Postfix) with ESMTPA id 508D6A388F
	for <ath11k@lists.infradead.org>; Sun, 14 Apr 2024 07:09:32 +0800 (CST)
DKIM-Filter: OpenDKIM Filter v2.11.0 vm-805d5b38-61.novalocal 508D6A388F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wjhnt.com;
	s=default; t=1713049772;
	bh=lxSTh46eS6wiYr6UM14IUEbWRxI2sgGCEKGFAUB+uVk=;
	h=From:To:Subject:Date:From;
	b=PNqll/rDfrpj4QsvPsHHRAx8rDY+z+2r/qVMWKEMqWLhFlUtlAFmK8aCfOsGKZppo
	 SF6GpV4C/6Al3DfDNWko7oWpVrjZ6l7qjflFzN3sdrvwRxtUIR2JdEHtRwnV5RVGTv
	 tpOmRt0eSwwJ+oEuObQeRoDUyn/46sxOvOJKrrZA=
Message-ID: <e6ad3345361f4e8d0cf25d4919a2c780@wjhnt.com>
From: no-reply <premonition@wjhnt.com>
To: ath11k <ath11k@lists.infradead.org>
Subject: =?utf-8?B?44CQ44Kz44Kk44Oz44OB4oGh44Kn44OD44Kv4oGh5qCq5byP?=
	=?utf-8?B?5Lya56S+44CR4oGh6YeN6KaB44Gq77iJ44GK55+l44KJ44Gb77yB4oGk?=
Date: Sun, 14 Apr 2024 08:09:30 +0900
X-Priority: 3
X-Mailer: Sucsgvjdv Ttjpymo 3.9
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240413_170301_843477_0CCE3B35 
X-CRM114-Status: UNSURE (   0.21  )
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

Q29pbmNoZWPvuIlr44KS44GU5Yip55So44GE44Gf44Gg44GN77iJ44GC44KK44GM44Go4oGk44GG
44GU4oGk44GW44GE4oGk44G+44GZ4oGk44CCDQoNCuaal+WPt+izh+eUo+OBrumAgemHkeOAgeS4
puOBs+KBoeOBq+aXpeacrOWGhuWHuumHkeOCkuWItumZkOOBl+KBpOOBpuOBiuOCiuOBvuOBmeOA
gu+4iQ0KDQrilqDjgYrvuInllY/jgYTvuInlkIjjgo/jgZvjg5XjgqnvuInjg7zjg6ANCmh0dHBz
Oi8vY29pbmNoZWNrLmJ1b3BkLmNvbS8/b25ldG9rZW49VkVvZ2Y0Z2FLNUJHJnRva2VuPWxvTmVL
RDQwYkZQNTMNCg0KDQrigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigaHigJXigJXigJXi
gJXigJXigJXigJXigJXigJXigJXigaHigJXigJXigaHigJXigJXigJXigJUNCuOCs+OCpOODs+OD
geOCp+ODg+OCr+agquKBpOW8j+S8muekviDms5Xli5njg7vjgrPigaTjg7Pjg5fjg6njgqTjgqLj
g7Pjgrnpg6gNCuOAkjE1MC3vuIkwMDQ0IOadseS6rO+4iemDvea4i+iwt+WMuuWGhuWxseeUujMt
Nu+4iSBF44O744K577iJ44Oa44O844K544K/44Ov44O84oGkMTBGDQpVUkwgOiBodHRwczovL2Nv
aW5jaGVjay5idW9wZC5jb20vP2ZhcT0yUXlZWUpKbnM4cHlpT1l3RA0K5pqX5Y+36LOH55Sj5Lqk
5o+b5qWt55m777iJ6Yyy44CA6Zai4oGk5p2x6LKh5YuZ5bGA6ZW3IOesrDAw4oGkMDE05Y+3DQrl
iqDlhaXigaTljZTkvJrjgIDkuIDoiKznpL7lm6Pms5Xkurrml6XvuInmnKzmmpflj7fos4fnlKPl
j5blvJXmpa3ljZTkvJrigaENCuKAleKAleKAleKAleKAleKAleKAleKAleKBoeKAleKAleKBoeKA
leKAleKAleKAleKBoeKAleKAleKAleKAleKAleKAleKAleKAleKAleKAle+4ieKAleKAlQ0K4oC7
5pys44Oh44O844Or44Gu5YaF5a6544CB44OG77iJ44Kt44K544OI44CB55S75YOP44Gq44Gp44Gu
54Sh4oGh5pat6Lui6LyJ44O754Sh5pat4oGh5L2/55So44KS56aB5q2i44GX44G+44GZ44CCDQoN
CnRocmVhZDo6MzNCN2d6WWM5MlU5U2t2Ym5EbHJXN2E3Ojo=


