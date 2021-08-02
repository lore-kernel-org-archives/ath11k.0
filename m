Return-Path: <SRS0=Cifq=M3=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,LOTS_OF_MONEY,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08690C4338F
	for <ath11k@archiver.kernel.org>; Wed,  4 Aug 2021 19:08:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AEC9361002
	for <ath11k@archiver.kernel.org>; Wed,  4 Aug 2021 19:08:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org AEC9361002
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=posteo.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:In-Reply-To:Date:To:From:Subject:Message-ID:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=sGEOg0tBfX3YpRS2kiqEMgyObLVk+XFmH5J2eQJPy1M=; b=1CRtvhITTMzdaz
	sq9NLMFi0hJ+otdfZDv3WuwIhjyvTnTw56XOL/leD8KOgrO+EV+rMaAepoGW/m8RC4bJYHlzdyBA0
	sTSbNNZIk9WxIZbOnDugQx2NwdYHtej1pN3X+C4XYYytTz6HhtPEmyQzz/IDKZoHu1vxH3m1lUs4u
	F1rThYktwXMCDV4ESRwnC/6lOqFNyZhcW5iNVNsF9j6rxyPmiUyJeyfZDTVBYqZAqk4v1i4VGaP3Q
	JaPnxSBCFqQQNKbd/ibiIhRxFbUlVgqWQEBM0OkyWNcdm2bBb89YtgVfq10pwV0oylAMsN79/M66B
	WgB6rytxlMvErMS515LA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mBMFZ-007Gtp-1O; Wed, 04 Aug 2021 19:08:21 +0000
Received: from mout01.posteo.de ([185.67.36.65])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mASFc-00FGyn-55
 for ath11k@lists.infradead.org; Mon, 02 Aug 2021 07:20:42 +0000
Received: from submission (posteo.de [89.146.220.130]) 
 by mout01.posteo.de (Postfix) with ESMTPS id 7BB62240026
 for <ath11k@lists.infradead.org>; Mon,  2 Aug 2021 09:20:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.de; s=2017;
 t=1627888832; bh=in8l24jCyIqP1JKiLdGT1ayFwKPpsGgoTUMlF+XOuHA=;
 h=Subject:From:To:Date:From;
 b=F2UVMucFF6P3RlPWG6aPfgZdxAXiAPApo1KkMR3G4jbREKRzKt9rN0tc+3BHMu17X
 xLME6E7xty8/Z9cGZKa4S27MAEXBorRdIqN9iG3696dwO6W234eG1//5URPqeVz4uW
 7ixtn0r4Cyjk4OggKFVRVjpuq97deq3omTVm1Tle5/ikFzNZ6j1LRFEU+7eD4lIw3R
 j/kzpZQu4O5dz5T0GjzXH3I+Qi2TyY9jHFoxHz27QKoCDZoRqARRX4D99f+IIDoutQ
 LLXX8jGSanrI68YIFWpn/TFoeej1wkA97YytNMmhCVg9nXRfQdgh7J/fneDyDOPrML
 zVh9gtsSeuSmw==
Received: from customer (localhost [127.0.0.1])
 by submission (posteo.de) with ESMTPSA id 4GdTtQ38Sfz6tmR
 for <ath11k@lists.infradead.org>; Mon,  2 Aug 2021 09:20:30 +0200 (CEST)
Message-ID: <408a86cfc4dfd5a2054651f36033222e917a5f5c.camel@posteo.de>
Subject: Re: Re: Have the QCA6390 patches for XPS 9310 landed yet?
From: Dominik =?ISO-8859-1?Q?F=F6rderer?= <dominik.foerderer@posteo.de>
To: ath11k@lists.infradead.org
Date: Mon, 02 Aug 2021 07:20:29 +0000
In-Reply-To: <f5648123-c612-bb5a-dce4-1022aedc28c8@gecius.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210802_002040_714129_3ACA6AE0 
X-CRM114-Status: GOOD (  20.04  )
X-Mailman-Approved-At: Wed, 04 Aug 2021 12:08:19 -0700
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
Content-Type: multipart/mixed; boundary="===============6341724412499961034=="
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org


--===============6341724412499961034==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-qirI9HjXV7C1ZSdMTCIQ"


--=-qirI9HjXV7C1ZSdMTCIQ
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am 30.07.21 um 23:52 schrieb Justin Mazzola Paluska:
>> On 7/30/21 4:08 PM, wi nk wrote:
>>>> On Fri, Jul 30, 2021 at 10:01 PM Kalle Valo <kvalo at codeaurora.org>>=
=20
>>>> wrote:
>>>>>> Mitchell Nordine <mail at mitchellnordine.com>> writes:
>>>>>>
>>>>>>>> Hi kvalo and wink!
>>>>>>>>
>>>>>>>> It's been a while since I've had a chance to check in on this - ha=
ve I
>>>>>>>> missed any QCA6390 progress?
>>>>>>>>
>>>>>>>> Currently the nixos-hardware repo is fixed to 5.10.18 along with m=
ost
>>>>>>>> of the patches on ath11k-qca6390-bringup, apart from two commits t=
hat
>>>>>>>> I'm sure were merged a while ago.
>>>>>>>>
>>>>>>>>
https://github.com/NixOS/nixos-hardware/blob/31f61b90ddb9257b94888ee17ccf96=
236e180c76/dell/xps/13-9310/default.nix#L14
>>>>>>>>
>>>>>>>>
>>>>>>>> Just wondering if the rest of the patches or some alternative fixe=
s
>>>>>>>> have landed in a more recent version of the kernel yet, and whethe=
r
>>>>>>>> it's worth diving in and updating our nix expr yet?
>>>>>> Basically all you need is a BIOS update for XPS 9310 (to get 32 MSI
>>>>>> vectors working) and a recent Linux release. I don't remember the ex=
act
>>>>>> kernel release, and can't check it now, but something like v5.12 or
>>>>>> v5.13 should work without extra patches.
>>>>>>
>>>>>> --=20
>>>>>> https://patchwork.kernel.org/project/linux-wireless/list/
>>>>>>
>>>>>>
https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatc=
hes=20
>>>>>>
>>>>>>
>>>>>> --=20
>>>>>> ath11k mailing list
>>>>>> ath11k at lists.infradead.org
>>>>>> http://lists.infradead.org/mailman/listinfo/ath11k
>>>>
>>>> Hey Mitchell!
>>>>
>>>>    Just to add a little, Dell released a BIOS update that now allows
>>>> the driver to obtain all 32 MSI vectors (I posted around the time that
>>>> happened if you need the earliest version, otherwise just grab the
>>>> latest version).  I've been running 5.12 and 5.13 without WIFI issues.
>>>> Occasionally I still have bluetooth problems and the i915 drivers are
>>>> causing video artifacts randomly, but the wireless connection seems
>>>> pretty solid at this point.
>>
>> Which BIOS do you have?  I have 1.2.5.

>Just to add my experience - WiFi and BT are working. I'm on BIOS 3.0.4=20
>(upgraded today via fwupdmgr / lvfs) with 5.13.5 / fedora 34 / xps 9310=
=20
>32G dev edition. BT works since BIOS 2.something and kernel 5.12

>No memmap kernel parameter needed.

>>
>> I'm currently running 5.13 with a patch that reverted=20
>> 3579994476b65cb5e272ff0f720a1fd31322e53f.  I needed to do that or the=
=20
>> 5.13 kernel wouldn't connect to my access point because the firmware=20
>> crashed.  (I got that pointer from=20
>> https://bugzilla.kernel.org/show_bug.cgi?id=3D212059.)  With 357999=20
>> reverted, everything works well.
>>
>> I still have the memmap=3D20M$12M kernel argument set from the old qca=
=20
>> bringup branch days.  Do you also use that?
>>      --Justin
>>

I have the exact same issue as Justin described. I am on Bios 3.0.4 and Ker=
nel
5.13.7 on Manjaro. I also have to revert
3579994476b65cb5e272ff0f720a1fd31322e53f to prevent the firmware from crash=
ing
while connecting to my AP.
I figured out that the Problem is, that my router (Fritzbox), which is very
common in germany provide a (not changable) 160MHZ 5GhZ network. With 80MhZ=
 or
lower there are no problems and ath11k is very stable.
Wen Gong released a patch e6ed929b4140d293bf8523f0376ed9bbdce29c47 for 5.14=
 to
address this Problem, but this patch caused a very unstable and randomly
crashing wifi on every channel width (20, 40, 80, 160 MhZ). On 5.14 i have =
now
to revert both mentioned patches to have a stable wifi. I posted this probl=
em to
this list on june, but no one might mentioned it.

Dominik=20

--=-qirI9HjXV7C1ZSdMTCIQ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE/aqy/cgEwKGVC3ggzEcPcFfNeUsFAmEHnL0ACgkQzEcPcFfN
eUvqUA/9F59qS7oWknOim5OHEFPma83hzChWdg1yLGpdUsV8qdIOXb5nbYD534eW
aufxu5P86cMf1cPJMaMqaMbLdVV/dJ3L6crIayh/JVCtujAOwlgUBnMMmiqGVs/X
N1AuXohnq3piN7hMfbT5bmy+6auTr4LWYrbeQAfzW7k/vjZCqqGl/6b1QOQESjGs
2Igf9f6+sUIfJU16FoBOBxpYD56GnCLPLVUjdhhSyDdGbeEZgsc9TqomsCvvlVKj
bmL5uQkd4p+uMGHHmrMr3AG+nZ6HzFf7MylcOpWtjrUGJ0CuEV1f+mX86xTcOg0C
+WYfqKHsGT/8d0bNnHjEMdE2hS2yJgeyE9LMDH6HwA8jwoWMxhgIDx+K9ZgAymBX
erNKcV+AbLPuJMCazQwmbh+uynB70onn7I+DnJhTHrc5nHESVe7Ici5B35y7mzow
VOb3bdt3EylePl1u5RijagCjkLqPLnTsl6OSq6l+7IF/dQOEJHRE5ULejPZVKODk
938mxfhyO9UbXOyT6xB7El1swuQtvptoo+FphoyzKjL57fshfX+c7wzEs9nVtYwq
ZaX68N3CIFkhES0JPLo+3f926bd7BdlrdSTx+ZI9w+Wi5E9evmWkjbXdDfsW5J+l
O6g5inXwXiTzOwXP8O/LSR9hu/dXlAxT85Rxb+ZycwVzB/F2H/4=
=bdDT
-----END PGP SIGNATURE-----

--=-qirI9HjXV7C1ZSdMTCIQ--



--===============6341724412499961034==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k

--===============6341724412499961034==--


