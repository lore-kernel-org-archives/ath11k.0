Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0F35D10F24
	for <ath11k@archiver.kernel.org>; Sun, 17 Nov 2024 17:02:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	From:References:To:Subject:MIME-Version:Date:Message-ID:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iOWSsB50h92bNKbaofF9mxw1QTrQ7tS0erITrfPfNik=; b=H6PudLQYeUyJ/jvCY+ooiM3L/o
	M75CpfdnhzgpmkSW8GUT9Gm5Ig218yC7FcG1M1MTmkXtuTQE5jSFr5r0OKneVpzq8DzkTFT+hNyE0
	IS0LFOryBbUncAxdBlNESJlo4KiPehBW7HRe0IBs3MLu35olJa3/RteZR/SLwW1Mju0esXGh79f8G
	W2zu21eGuTiyvyYmvo4FUrg+v5EGAn7BJaVRqAbLw45m5p9vhcZDMc21a076b87SFc72h5RTawDAp
	1juBV4alQugceKjKWmo0ABCo3AVKTajQbcul7MpZX3cyVzguS6YUJYBwxR2/WEd+VZWH+qICZSXrn
	vq+Ci+nA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tCifb-00000007ais-2GOK;
	Sun, 17 Nov 2024 17:02:43 +0000
Received: from ionic.de ([2001:41d0:700:3394:1::2] helo=mail.ionic.de)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tCicZ-00000007aMP-44Z6
	for ath11k@lists.infradead.org;
	Sun, 17 Nov 2024 16:59:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ionic.de; s=default;
	t=1731862774; bh=iOWSsB50h92bNKbaofF9mxw1QTrQ7tS0erITrfPfNik=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=quZMDf1M9DYJmC+0+oiQA9AD2TdFO/Sl/6tDe4RahKD0l2oZ1CxpRsBFn+OJ+BGGz
	 MvSNn2FiF4TKX5Ete5UZ4Yni0WgT0aZ2JnkLoHP4ZcAdrSInmwI5H3Ojw3yU/L32yI
	 IZeT4IRvXQ3rGAxsDYK8watbjx51hzz+saMMQF+8=
Received: from [172.22.111.213] (185.102.219.38.adsl.inet-telecom.org [185.102.219.38])
	by mail.ionic.de (Postfix) with ESMTPSA id 69DE21480CDE
	for <ath11k@lists.infradead.org>; Sun, 17 Nov 2024 17:59:34 +0100 (CET)
Message-ID: <4c5a9c95-13a3-440a-9947-a11209876c0b@ionic.de>
Date: Sun, 17 Nov 2024 17:59:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC] [PATCH 00/13] ath1{1,2}k: support multiple PCI devices in
 one system
To: ath11k@lists.infradead.org
References: <cover.1731858971.git.ionic@ionic.de>
Content-Language: en-US
From: Mihai Moldovan <ionic@ionic.de>
Autocrypt: addr=ionic@ionic.de; keydata=
 xsFNBEjok5sBEADlDP0MwtucH6BJN2pUuvLLuRgVo2rBG2TsE/Ijht8/C4QZ6v91pXEs02m0
 y/q3L/FzDSdcKddY6mWqplOiCAbT6F83e08ioF5+AqBs9PsI5XwohW9DPjtRApYlUiQgofe9
 0t9F/77hPTafypycks9buJHvWKRy7NZ+ZtYv3bQMPFXVmDG7FXJqI65uZh2jH9jeJ+YyGnBX
 j82XHHtiRoR7+2XVnDZiFNYPhFVBEML7X0IGICMbtWUd/jECMJ6g8V7KMyi321GP3ijC9ygh
 3SeT+Z+mJNkMmq2ii6Q2OkE12gelw1p0wzf7XF4Pl014pDp/j+A99/VLGyJK52VoNc8OMO5o
 gZE0DldJzzEmf+xX7fopNVE3NYtldJWG6QV+tZr3DN5KcHIOQ7JRAFlYuROywQAFrQb7TG0M
 S/iVEngg2DssRQ0sq9HkHahxCFyelBYKGAaljBJ4A4T8DcP2DoPVG5cm9qe4jKlJMmM1JtZz
 jNlEH4qp6ZzdpYT/FSWQWg57S6ISDryf6Cn+YAg14VWm0saE8NkJXTaOZjA+7qI/uOLLTUaa
 aGjSEsXFE7po6KDjx+BkyOrp3i/LBWcyClfY/OUvpyKT5+mDE5H0x074MTBcH9p7Zdy8DatA
 Jryb0vt2YeEe3vE4e1+M0kn8QfDlB9/VAAOmUKUvGTdvVlRNdwARAQABzR9NaWhhaSBNb2xk
 b3ZhbiA8aW9uaWNAaW9uaWMuZGU+wsGfBBMBCABJAhsjAh4BAheAAhkBCwsKDQkMCAsHAQMC
 BxUKCQgLAwIFFgIDAQAWIQRuEdCPdTOBx0TxyDwf1i7ZbiU6hwUCZwAtBAUJH/jM6QAKCRAf
 1i7ZbiU6h8JHD/9odGNQMC0c/ZyvY80RFQTdi63cIc0aLG7kbYvUmCVQbNN/r6pGDVKXiBqa
 DjrB3knyYpcAVq2SIRZLjkCgCGQimfb3IZVfyl730fc8Z1xdQ87/FbHrdqIjNFyvYgkM24AU
 VoAyw0EBm99TiO/MFaHmD4T75l437EWA8KbDha9p+N2GHcxYJeJbQJ6rajpQZ0HFF20b5jF8
 8de2g8kbQR1GPJgGGmJ8m07kfEl2kcgEwI/HZ3tVUBTwJ+dJf6IWy4pC8DZiZWaQao31nVzC
 RbpqOtevh/P6MeNeDKHBjlV0rEStCCz0xtA4U8/vDOVnk42IqsxkRmiPNh4U62jkh10D2CMd
 kCiBoOgU5KGC2Tbnc8XWr2E5AJywpsmFlTZ77Gv1HoKp1tOQ2RMNVWNqGV89BaUm15BSRPHG
 qzp7Tm4eMLnMvJyon36B01N/JRuNpDpHeGnDHyeqhnQqE8jrqQnwi2TDa2dKuHLlD9Of8LyV
 ewCwiVUhdWIINdTjkyN/0brzr//mhg6H/iEpnkm5i++gsRvQZgZip5ft51jzMjRg1nZujfYZ
 Ow2ss2kSQ3gA3rfRhxx3OAqa5b45CH56rvmY97wHBrWbJxevqNj6quLBNtl64aceJWyTgWue
 vShUhOP6wz5qq/+SxkKRiGndjE1HVmx4iOO413Crz0QfawCIjs7BTQRI6JObARAA8Prkme+B
 PwRqallmmNUuWC8Yt+J6XjYAH+Uf0k/H6MLA7Z+ZL8AHQ+0N306r/YFVnw2SjhaDODwhRoMv
 dOKtoIcJZ9L0LQAtizhZMbHCb+CMtcezGZXamXXpk10TzrbI9gnROz1xBnTkzpuOkgo43HRx
 7GuYy+imM4Lxh/hfgRM6MFjQlcIsUd0UGRCxuq8QmxRqQpRougCwPeXjfOeMRkaQUI7A8kLJ
 7bTmSzjB9fSBv63b7bajhFHid1COYGe3EZOYRi1RTzblTnq2Fdv+BN/ve/9BdZgApfRSX8Qk
 uLsuZF9OWHxIs3wwpvqFoyBXR29CqgrcQFFA/Lm3i/de3kFuXJUVFTYM4tLwV85J9yGtK6nU
 sA/v6LXcaTGrQ9P3rJ3iVPYKuyF2w8IMqvFTnHu6+nCvBJxLymOsYJFN4W/5TYdWk1hdIYmm
 NlM/PH+RWL8z+1WWZgZOBPFJ0FQQbDvTMP6m0/GZT1ZFUVoBG/FAiIQ9UDl8gRsGfe0wS6gz
 k2evXeAZQyZCii3Dni7Di2KjaPpnl/1F7Zelueb7VbgdoPRmND9rFixI6bFC4yjlSnL5iwIi
 ULDkLDJN5lcRHI5FO/6bzwVSgHmI+eMlNA/hysdTtp9AjE7VkVxeC9TJ+kEZDv5VUTSxUpNs
 Wj922PkX+78EYPPGTOG4xx7PMqcAEQEAAcLBfAQYAQgAJgIbDBYhBG4R0I91M4HHRPHIPB/W
 LtluJTqHBQJnAC0SBQkf+Mz3AAoJEB/WLtluJTqHtDUP/0O2gsMtgo07wIOrClj6UQJIs8PL
 2sLHwvcmhQyFxPpa8wUAckJ2n3OpbjP22HP8tObT+Nhs7czTwelEFNdVcINBjnEPvJ5JNDuY
 h0qmP9wE6rQc2MKdS0ZjggeS4zEkiQI/WVOWhRTVNYUASQHMqrOB2ZZ6QWqND5uqfRTNfHAd
 5bDGl4FNpH9lklmXTm/CbR0V0cYgkYCOUTLmNkur4AZIz5WPMgYXakz9K94SFzEDjZqr+nko
 S1hPiakYd3lUNXy9LAQ/YD7balC80jhB+/CFcb0DgNwADVjLz6lAwYl0/r5WGCBIVy0kwq4b
 dtO59zKJ4wAIKysW2Z42UJ5TvwinuOAHKHrZ3E17MQNNojcgi0tw88mSSkfDrZVqFKzjruhm
 HAe7PMdAJ1C4i21U6N5CSG+UwORWnPXKiKYbi3u9LXHqMwwzPxiAGbnmu4F4Fe7pHidRPTX8
 xa2k8AipcPkLlwnm1ZKP/gZL0+NLUR9ky2W2B8YpfGwqBVuQ/C30PkXaEydd2IaVd+Lv6lLj
 4zysWLWKUKPFdlI744AxkyDlFlbFbmICgQJ0AuBmgJRLtjLAfIlOKgfZguWA+uCo4F/mPZ7x
 5CGLSvKqaA3YaiH85ziT5CjbFlMjbZrTHvI4/gprmgHEdec5BgQAaZ+z8sIbplcJwNp+GDq2
 S0VlnF9z
In-Reply-To: <cover.1731858971.git.ionic@ionic.de>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------bQDqGKs6kin0hPmTKkYRbuYh"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241117_085936_191770_A823E33D 
X-CRM114-Status: GOOD (  10.15  )
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

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------bQDqGKs6kin0hPmTKkYRbuYh
Content-Type: multipart/mixed; boundary="------------aSE8T2ChtCRsZ0ZOZz7uH1jF";
 protected-headers="v1"
From: Mihai Moldovan <ionic@ionic.de>
To: ath11k@lists.infradead.org
Message-ID: <4c5a9c95-13a3-440a-9947-a11209876c0b@ionic.de>
Subject: Re: [RFC] [PATCH 00/13] ath1{1,2}k: support multiple PCI devices in
 one system
References: <cover.1731858971.git.ionic@ionic.de>
In-Reply-To: <cover.1731858971.git.ionic@ionic.de>

--------------aSE8T2ChtCRsZ0ZOZz7uH1jF
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SnVzdCBzb21lIHNwZWxsaW5nIGZpeGVzIEknbGwgc3RhZ2UgZm9yIGEgdjIsIHNpbmNlIG1p
c3Rha2VzIG5hdHVyYWxseSBvbmx5IA0KYmVjb21lIG9idmlvdXMgYWZ0ZXIgcmVhZGluZyB3
aGF0IHdhcyBzZW50IG91dC4uLg0KDQoNCiogT24gMTEvMTcvMjQgMTc6MDUsIE1paGFpIE1v
bGRvdmFuIHdyb3RlOg0KPiBbLi4uXQ0KPiBzb2NrZXQgYW5kIGJvdW5kIHRvIGZvciBjbGll
bnQgc29ja2V0cywgd2hpY2ggd2lsbCBhdXRvbWF0aWNhbGx5IGZpbHRlcg0KPiBtZXNzYWdl
cyBmcm9tIG90aGVyIGVuZHBvaW50cyBhbmQgYWxzbyBtYWtlIHN1cmUgdGhhdCBtZXNzYWdl
cyBjbGllbnRzDQo+IHNlbmQgYXJlIHJvdXRlZCB0byB0aGUgY29ycmVjdCBlbmRwb2ludC4N
Cg0KWy4uLl0gYW5kIGFsc28gbWFrZSBzdXJlIHRoYXQgY2xpZW50IG1lc3NhZ2VzIGFyZSBy
b3V0ZWQgdG8gdGhlIGNvcnJlY3QgZW5kcG9pbnQuDQoNCg0KPiBbLi4uXQ0KPiBhbmQgYWRk
aXRpb25hbGx5IG5ldyBBUEkgaXMgaW50cm9kdWNlZCBzbyB0aGF0IG90aGVyIHBhcnRzIGlu
IHRoZSBrZXJuZWwNCj4gY2FuIGVpdGhlciBnZXQgYW4gZW5kcG9pbnQgSUQgZm9yIGdpdmVu
IGVuZHBvaW50LXNwZWNpZmljIGRhdGEgb3IgZXZlbg0KPiByZWdpc3RlciBlbmRwb2ludC1z
cGVjaWZpYyB3aXRoIGEgbmV3IGVuZHBvaW50IElEIHRoYXQgaXMgZ2VuZXJhdGVkIGJ5DQo+
IHRoZSBRUlRSIGRyaXZlci4gWy4uLl0NCg0KWy4uLl0gb3IgZXZlbiBhdHRhY2ggZW5kcG9p
bnQtc3BlY2lmaWMgZGF0YSB0byBhIG5ldyBlbmRwb2ludCBJRCBnZW5lcmF0ZWQgYnkgDQp0
aGUgUVJUUiBkcml2ZXIuDQoNCg0KDQpNaWhhaQ0K

--------------aSE8T2ChtCRsZ0ZOZz7uH1jF--

--------------bQDqGKs6kin0hPmTKkYRbuYh
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEEbhHQj3UzgcdE8cg8H9Yu2W4lOocFAmc6IPUFAwAAAAAACgkQH9Yu2W4lOodi
thAAxjDY8GPI2FN4QNsJNAMtY/3g/DicaGJ+sju5cGzrFIVmWeqBJxb7ErkWLkGgDd6S0sPbJa9X
jd68gtQoKaIGLE7PXqf4i2tyCQ9vRzeUkgF5Z8tVA0BgDYBPOjtvmT13PLgthM9G7w2t3Y/a0z2A
V1yMiLEHU/eMNJsuYju2QpEX7zJhmHTD4vSoLb1E13q8AeSDkcV6A0vZyzl7N5HdeqTWa/C3k/4j
8vMws7BkM6+KxWMI4Q4TeSf+v4K7Z+IpRk/QB0LMqA6cDV7YUZ0yb1LTsEdu9OKFDFXVdgzoXhuR
1EQlZxpQR8t8NwXJ60I6tsO1pCeShJKqCIMH8mKVZPtL3B8/zZcJYHmMszwSVIigq+17CsR/Btj8
9ezU86vJCzHT2RpjHJi7+5Q8lrRwO7/8TPBLsT/9gR1XdXZIdFjpwHtYTT0wpKTl4Jsz7tGHnu49
Ra8Za3b2Sov+L8f0LMfXZ742dXUooi9k4nlWU20ijbTqmw5LB7woa9uLj8vMkczt9ecqTqGHut/y
lXEHzRd1svUlMeiyWDLFFgOu5HCi1I3XQEvG4WhCL6viUFkUHOgO//mohrAP2eNrk7IroloV7zPl
xEAykzigkSKy+m7Nm97jGEYIncoP1hDS+Lhn2TSyYY2M9JFADWP/NbcpSfIldPBobE5u2AzbnLWF
+FM=
=XlgZ
-----END PGP SIGNATURE-----

--------------bQDqGKs6kin0hPmTKkYRbuYh--

