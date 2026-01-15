Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F94AD3CC9F
	for <ath11k@archiver.kernel.org>; Thu, 15 Jan 2026 08:20:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Kgip1bKFrTPG9c2JsFgljQmYZi6HcbppxU5CdVuIuZo=; b=hEWJLZS4bhk18qpJ8gV6Tdxb/N
	b6iLt+COaeN2rRTXOH9XmS5CDWCcZ08vYMDma8Ye6Ddc8QGfWdA8lTEMQfFugCBDhO7qhPRtg0P1w
	hOKEd+Hu+xn2Rjfsb7VgLzkD6lQbqUZ1qHJgklmNWDqmKbnhPlcR7PuGqqb4902HhaBPKmJzk0OOA
	abw6PxX4WqjuLNtrHckEi8PiqjpwRew6dpXqVp6UZnuKegvhc3Uzf7fQjCD/tAWwtkl0MceFtTZTJ
	snQ8TY08OPaXfyaHV2Osm8NvJBHjRG1rIX2HZfzNqNll2U1yZ2tAgNvfO2V45AzfXXV3yidHJ0Af8
	ixW9jDyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgIai-0000000BzQR-1oIV;
	Thu, 15 Jan 2026 08:20:28 +0000
Received: from sender4-op-o15.zoho.com ([136.143.188.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgIaf-0000000BzQ6-2Kk3
	for ath11k@lists.infradead.org;
	Thu, 15 Jan 2026 08:20:26 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1768465220; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=W61ILOhWMba/+q7dc66NIlC7XyYlPy5j08DIO+XRgpHRjZq6meacGdQZUtSW4E3mjhWinDUgkN6L3eXAEfA4Tcq8Rzldy47rXnYk6goJh5I6+YvMpjUEt0bbPFwKfFYXvsyvPEFkzMY0kL5MDR+gDztD99sLaemQxbmMzFXfu0U=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1768465220; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=Kgip1bKFrTPG9c2JsFgljQmYZi6HcbppxU5CdVuIuZo=; 
	b=cwJhIPq1CT53lHkxJ12MLtfHzYJPPzrrcRMm83/CE586+RGMNxBFe+tkDruY1uQQyPQzsGUfxiG/xuWfRKct9saczc3Cl2VksCJERMsQ39TG0j0NRPKupxfVLOjG5p7eYNSpnlYHYfKzjPw+Xf7LzwBcqnT1b8DX6cu/006o+lQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=xv97.com;
	spf=pass  smtp.mailfrom=m@xv97.com;
	dmarc=pass header.from=<m@xv97.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1768465220;
	s=zmail; d=xv97.com; i=m@xv97.com;
	h=Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Date:Message-Id:Message-Id:Cc:Cc:Subject:Subject:From:From:To:To:References:In-Reply-To:Reply-To;
	bh=Kgip1bKFrTPG9c2JsFgljQmYZi6HcbppxU5CdVuIuZo=;
	b=aCHZXmKosSKPg1eh1SZr717U6SBxMF93DPnMNn/7WJl9iH0jqT0fCghw5qKL9caa
	eonL5R4yQ4woBb3Iz+8zZ9JLGmWB6XRdeJBQS9qhL52gk/8QoHgT3N7Urvo2cjynItS
	yPODfQ/7E86MJws/t3MsCGXnqK34gobKxH18KNDc=
Received: by mx.zohomail.com with SMTPS id 1768465217051452.0691473771633;
	Thu, 15 Jan 2026 00:20:17 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 15 Jan 2026 16:20:12 +0800
Message-Id: <DFP0LJ1BX1US.2KD2FIIVAKD3S@xv97.com>
Cc: <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH] wifi: ath: fix comment typo in monitor mode handling
From: "Chien Wong" <m@xv97.com>
To: "Jeff Johnson" <jeff.johnson@oss.qualcomm.com>, "Chien Wong"
 <m@xv97.com>, "'ath11k@lists.infradead.org'" <ath11k@lists.infradead.org>
References: <20251030143041.12027-1-m@xv97.com>
 <a47cfe9f-01eb-4cdd-ac97-421f3c8a3451@oss.qualcomm.com>
In-Reply-To: <a47cfe9f-01eb-4cdd-ac97-421f3c8a3451@oss.qualcomm.com>
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260115_002025_649548_884C17D1 
X-CRM114-Status: GOOD (  10.17  )
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

On Thu Jan 15, 2026 at 12:34 AM CST, Jeff Johnson wrote:
> On 10/30/2025 7:30 AM, Chien Wong wrote:
>
> Subject should have use "ath11k:"
> I'll fix this in my pending branch
>
> And I've removed the ath12k list and added the ath11k list
>
>> Correct a typo in the monitor mode comment where "it make" was mistakenl=
y
>> used instead of "it doesn't make". The comment explains that the brief
>> period where monitor mode appears enabled before being removed is harmle=
ss
>> in practice.
>> Also, use more common phrase "in practice" instead of "in practise".
>>=20
>> Fixes: 3f6e6c3291ed ("ath11k: disable monitor mode on QCA6390")
>> Fixes: d889913205cf ("wifi: ath12k: driver for Qualcomm Wi-Fi 7 devices"=
)
>
> And I'll drop the Fixes tags since there is no code change and hence no n=
eed
> to backport this change to stable kernels.
>

As a newbie in kernel development, I now understand the use of Fixes tag.
Thank you.

Regards,
Chien Wong

