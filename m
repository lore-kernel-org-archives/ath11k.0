Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D86EAC433EF
	for <ath11k@archiver.kernel.org>; Mon, 29 Nov 2021 08:55:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pl9KJeYjqTE7gbxcjfDAUF8cfLcItxcCon2KFX6H3Kc=; b=MjEvS/14fD92vbIjNZVKaDLUHn
	mbHS2+l0mhE1GVriUXFiEiINQ9wTZxGbczn/b1ZvVpYjwYq0bfs0UsuT8bNrKoaNlo96xwHXJOdAr
	5CCfo6jihl4na9wReGy4qMRX5VGX0JGqC/1WyxUUyLntDWIO2sx8QDdO0FHVpeluXIVwwCeGfo05Y
	1dd6lMWH5Rp0rrHvaHCbve1LkjLd2jmvxDp4kGHqvvx6oDXyptUqYQZ0/DoJGeDvq4iTuZqDz7ydQ
	X2H/pExLY9rvvymvRjwWNrqybzbYWVP5cFdySAd3SA+ZXpkerXsxkmBoNUoEtxoNWh2QlDEgQoLDZ
	IiY29jqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mrcRr-000ApE-Oc; Mon, 29 Nov 2021 08:55:43 +0000
Received: from smtp-out2.suse.de ([195.135.220.29])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mrI9G-00FXuQ-Sj
 for ath11k@lists.infradead.org; Sun, 28 Nov 2021 11:15:12 +0000
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 90C781FCA1;
 Sun, 28 Nov 2021 11:15:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1638098105; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Anljq+Wlt67ghjUgtowz33uZJuiJE7LcFFdumpYBPbQ=;
 b=cORDoLhhTv6Pvy/wEYOeaj0+noo8dvDMluC1ZpBarB3cAbHI40UN/1iHjN3bWBhVP0aizH
 /NMFWg6oCo5x8lgfMjsJuECexWXZtoh9byc1oggFWKSu02kWt9gazsZhgX4El5PzIxK+as
 2rxhxJh+CmJik0qb7yx5+btjpldJ70o=
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id ADEFE133D1;
 Sun, 28 Nov 2021 11:15:04 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id KhNhKLhko2FZUgAAMHmgww
 (envelope-from <jgross@suse.com>); Sun, 28 Nov 2021 11:15:04 +0000
Subject: Re: [patch 00/22] genirq/msi, PCI/MSI: Spring cleaning - Part 1
To: Thomas Gleixner <tglx@linutronix.de>, LKML <linux-kernel@vger.kernel.org>
Cc: Bjorn Helgaas <helgaas@kernel.org>, Marc Zygnier <maz@kernel.org>,
 Alex Williamson <alex.williamson@redhat.com>,
 Kevin Tian <kevin.tian@intel.com>, Jason Gunthorpe <jgg@nvidia.com>,
 Megha Dey <megha.dey@intel.com>, Ashok Raj <ashok.raj@intel.com>,
 linux-pci@vger.kernel.org, Michael Ellerman <mpe@ellerman.id.au>,
 Paul Mackerras <paulus@samba.org>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 linuxppc-dev@lists.ozlabs.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-mips@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, sparclinux@vger.kernel.org,
 x86@kernel.org, xen-devel@lists.xenproject.org, ath11k@lists.infradead.org,
 Wei Liu <wei.liu@kernel.org>, linux-hyperv@vger.kernel.org,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Heiko Carstens <hca@linux.ibm.com>
References: <20211126222700.862407977@linutronix.de>
From: Juergen Gross <jgross@suse.com>
Message-ID: <2b96282e-aa7e-f864-a4fe-a1211605b0d3@suse.com>
Date: Sun, 28 Nov 2021 12:15:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20211126222700.862407977@linutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211128_031511_147320_8DC147D4 
X-CRM114-Status: GOOD (  22.08  )
X-Mailman-Approved-At: Mon, 29 Nov 2021 00:55:42 -0800
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
Content-Type: multipart/mixed; boundary="===============3308694526895900265=="
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============3308694526895900265==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="Scpk3SAl3oj2hcLchcXspItyFiWaZIboV"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--Scpk3SAl3oj2hcLchcXspItyFiWaZIboV
Content-Type: multipart/mixed; boundary="XcilTgwO7ykUk5wJYdiDkIub8q5tPTxBW";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Thomas Gleixner <tglx@linutronix.de>, LKML <linux-kernel@vger.kernel.org>
Cc: Bjorn Helgaas <helgaas@kernel.org>, Marc Zygnier <maz@kernel.org>,
 Alex Williamson <alex.williamson@redhat.com>,
 Kevin Tian <kevin.tian@intel.com>, Jason Gunthorpe <jgg@nvidia.com>,
 Megha Dey <megha.dey@intel.com>, Ashok Raj <ashok.raj@intel.com>,
 linux-pci@vger.kernel.org, Michael Ellerman <mpe@ellerman.id.au>,
 Paul Mackerras <paulus@samba.org>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 linuxppc-dev@lists.ozlabs.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-mips@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, sparclinux@vger.kernel.org,
 x86@kernel.org, xen-devel@lists.xenproject.org, ath11k@lists.infradead.org,
 Wei Liu <wei.liu@kernel.org>, linux-hyperv@vger.kernel.org,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Heiko Carstens <hca@linux.ibm.com>
Message-ID: <2b96282e-aa7e-f864-a4fe-a1211605b0d3@suse.com>
Subject: Re: [patch 00/22] genirq/msi, PCI/MSI: Spring cleaning - Part 1
References: <20211126222700.862407977@linutronix.de>
In-Reply-To: <20211126222700.862407977@linutronix.de>

--XcilTgwO7ykUk5wJYdiDkIub8q5tPTxBW
Content-Type: multipart/mixed;
 boundary="------------6139348637D6BA4177E1F3E2"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------6139348637D6BA4177E1F3E2
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 27.11.21 02:18, Thomas Gleixner wrote:
> The [PCI] MSI code has gained quite some warts over time. A recent
> discussion unearthed a shortcoming: the lack of support for expanding
> PCI/MSI-X vectors after initialization of MSI-X.
>=20
> PCI/MSI-X has no requirement to setup all vectors when MSI-X is enabled=
 in
> the device. The non-used vectors have just to be masked in the vector
> table. For PCI/MSI this is not possible because the number of vectors
> cannot be changed after initialization.
>=20
> The PCI/MSI code, but also the core MSI irq domain code are built aroun=
d
> the assumption that all required vectors are installed at initializatio=
n
> time and freed when the device is shut down by the driver.
>=20
> Supporting dynamic expansion at least for MSI-X is important for VFIO s=
o
> that the host side interrupts for passthrough devices can be installed =
on
> demand.
>=20
> This is the first part of a large (total 101 patches) series which
> refactors the [PCI]MSI infrastructure to make runtime expansion of MSI-=
X
> vectors possible. The last part (10 patches) provide this functionality=
=2E
>=20
> The first part is mostly a cleanup which consolidates code, moves the P=
CI
> MSI code into a separate directory and splits it up into several parts.=

>=20
> No functional change intended except for patch 2/N which changes the
> behaviour of pci_get_vector()/affinity() to get rid of the assumption t=
hat
> the provided index is the "index" into the descriptor list instead of u=
sing
> it as the actual MSI[X] index as seen by the hardware. This would break=

> users of sparse allocated MSI-X entries, but non of them use these
> functions.
>=20
> This series is based on 5.16-rc2 and also available via git:
>=20
>       git://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git msi-=
v1-part-1

Tested with Xen (PV dom0, PV guest, PVH guest, HVM guest).

You can add my:

Tested-by: Juergen Gross <jgross@suse.com>


Juergen

--------------6139348637D6BA4177E1F3E2
Content-Type: application/pgp-keys;
 name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Transfer-Encoding: quoted-printable
Content-Description: OpenPGP public key
Content-Disposition: attachment;
 filename="OpenPGP_0xB0DE9DD628BF132F.asc"

-----BEGIN PGP PUBLIC KEY BLOCK-----

xsBNBFOMcBYBCACgGjqjoGvbEouQZw/ToiBg9W98AlM2QHV+iNHsEs7kxWhKMjrioyspZKOBy=
cWx
w3ie3j9uvg9EOB3aN4xiTv4qbnGiTr3oJhkB1gsb6ToJQZ8uxGq2kaV2KL9650I1SJvedYm8O=
f8Z
d621lSmoKOwlNClALZNew72NjJLEzTalU1OdT7/i1TXkH09XSSI8mEQ/ouNcMvIJNwQpd369y=
9bf
IhWUiVXEK7MlRgUG6MvIj6Y3Am/BBLUVbDa4+gmzDC9ezlZkTZG2t14zWPvxXP3FAp2pkW0xq=
G7/
377qptDmrk42GlSKN4z76ELnLxussxc7I2hx18NUcbP8+uty4bMxABEBAAHNHEp1ZXJnZW4gR=
3Jv
c3MgPGpnQHBmdXBmLm5ldD7CwHkEEwECACMFAlOMcBYCGwMHCwkIBwMCAQYVCAIJCgsEFgIDA=
QIe
AQIXgAAKCRCw3p3WKL8TL0KdB/93FcIZ3GCNwFU0u3EjNbNjmXBKDY4FUGNQH2lvWAUy+dnyT=
hpw
dtF/jQ6j9RwE8VP0+NXcYpGJDWlNb9/JmYqLiX2Q3TyevpB0CA3dbBQp0OW0fgCetToGIQrg0=
MbD
1C/sEOv8Mr4NAfbauXjZlvTj30H2jO0u+6WGM6nHwbh2l5O8ZiHkH32iaSTfN7Eu5RnNVUJbv=
oPH
Z8SlM4KWm8rG+lIkGurqqu5gu8q8ZMKdsdGC4bBxdQKDKHEFExLJK/nRPFmAuGlId1E3fe10v=
5QL
+qHI3EIPtyfE7i9Hz6rVwi7lWKgh7pe0ZvatAudZ+JNIlBKptb64FaiIOAWDCx1SzR9KdWVyZ=
2Vu
IEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+wsB5BBMBAgAjBQJTjHCvAhsDBwsJCAcDAgEGFQgCC=
QoL
BBYCAwECHgECF4AACgkQsN6d1ii/Ey/HmQf/RtI7kv5A2PS4RF7HoZhPVPogNVbC4YA6lW7Dr=
Wf0
teC0RR3MzXfy6pJ+7KLgkqMlrAbN/8Dvjoz78X+5vhH/rDLa9BuZQlhFmvcGtCF8eR0T1v0nC=
/nu
AFVGy+67q2DH8As3KPu0344TBDpAvr2uYM4tSqxK4DURx5INz4ZZ0WNFHcqsfvlGJALDeE0Lh=
ITT
d9jLzdDad1pQSToCnLl6SBJZjDOX9QQcyUigZFtCXFst4dlsvddrxyqT1f17+2cFSdu7+ynLm=
XBK
7abQ3rwJY8SbRO2iRulogc5vr/RLMMlscDAiDkaFQWLoqHHOdfO9rURssHNN8WkMnQfvUewRz=
80h
SnVlcmdlbiBHcm9zcyA8amdyb3NzQG5vdmVsbC5jb20+wsB5BBMBAgAjBQJTjHDXAhsDBwsJC=
AcD
AgEGFQgCCQoLBBYCAwECHgECF4AACgkQsN6d1ii/Ey8PUQf/ehmgCI9jB9hlgexLvgOtf7PJn=
FOX
gMLdBQgBlVPO3/D9R8LtF9DBAFPNhlrsfIG/SqICoRCqUcJ96Pn3P7UUinFG/I0ECGF4EvTE1=
jnD
kfJZr6jrbjgyoZHiw/4BNwSTL9rWASyLgqlA8u1mf+c2yUwcGhgkRAd1gOwungxcwzwqgljf0=
N51
N5JfVRHRtyfwq/ge+YEkDGcTU6Y0sPOuj4Dyfm8fJzdfHNQsWq3PnczLVELStJNdapwPOoE+l=
otu
fe3AM2vAEYJ9rTz3Cki4JFUsgLkHFqGZarrPGi1eyQcXeluldO3m91NK/1xMI3/+8jbO0tsn1=
tqS
EUGIJi7ox80eSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuZGU+wsB5BBMBAgAjBQJTjHDrA=
hsD
BwsJCAcDAgEGFQgCCQoLBBYCAwECHgECF4AACgkQsN6d1ii/Ey+LhQf9GL45eU5vOowA2u5N3=
g3O
ZUEBmDHVVbqMtzwlmNC4k9Kx39r5s2vcFl4tXqW7g9/ViXYuiDXb0RfUpZiIUW89siKrkzmQ5=
dM7
wRqzgJpJwK8Bn2MIxAKArekWpiCKvBOB/Cc+3EXE78XdlxLyOi/NrmSGRIov0karw2RzMNOu5=
D+j
LRZQd1Sv27AR+IP3I8U4aqnhLpwhK7MEy9oCILlgZ1QZe49kpcumcZKORmzBTNh30FVKK1Evm=
V2x
AKDoaEOgQB4iFQLhJCdP1I5aSgM5IVFdn7v5YgEYuJYx37IoN1EblHI//x/e2AaIHpzK5h88N=
Eaw
QsaNRpNSrcfbFmAg987ATQRTjHAWAQgAyzH6AOODMBjgfWE9VeCgsrwH3exNAU32gLq2xvjpW=
nHI
s98ndPUDpnoxWQugJ6MpMncr0xSwFmHEgnSEjK/PAjppgmyc57BwKII3sV4on+gDVFJR6Y8ZR=
wgn
BC5mVM6JjQ5xDk8WRXljExRfUX9pNhdE5eBOZJrDRoLUmmjDtKzWaDhIg/+1Hzz93X4fCQkNV=
bVF
LELU9bMaLPBG/x5q4iYZ2k2ex6d47YE1ZFdMm6YBYMOljGkZKwYde5ldM9mo45mmwe0icXKLk=
pEd
IXKTZeKDO+Hdv1aqFuAcccTg9RXDQjmwhC3yEmrmcfl0+rPghO0Iv3OOImwTEe4co3c1mwARA=
QAB
wsBfBBgBAgAJBQJTjHAWAhsMAAoJELDendYovxMvQ/gH/1ha96vm4P/L+bQpJwrZ/dneZcmEw=
Tbe
8YFsw2V/Buv6Z4Mysln3nQK5ZadD534CF7TDVft7fC4tU4PONxF5D+/tvgkPfDAfF77zy2AH1=
vJz
Q1fOU8lYFpZXTXIHb+559UqvIB8AdgR3SAJGHHt4RKA0F7f5ipYBBrC6cyXJyyoprT10EMvU8=
VGi
wXvTyJz3fjoYsdFzpWPlJEBRMedCot60g5dmbdrZ5DWClAr0yau47zpWj3enf1tLWaqcsuylW=
svi
uGjKGw7KHQd3bxALOknAp4dN3QwBYCKuZ7AddY9yjynVaD5X7nF9nO5BjR/i1DG86lem3iBDX=
zXs
ZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------6139348637D6BA4177E1F3E2--

--XcilTgwO7ykUk5wJYdiDkIub8q5tPTxBW--

--Scpk3SAl3oj2hcLchcXspItyFiWaZIboV
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmGjZLgFAwAAAAAACgkQsN6d1ii/Ey99
Ygf/TuyiJBY2+ZjWsQqU5ZSGT6YuYXhwPE+B8wmVLs7GMwz8vn9KaHJK68c79Ma6+or1pJ8bVeV1
/9/UXhj0i0p0EDWRpXfe20DMCw5VKZCXioTzX7sOsjqjNtkWbhml32Gvaa7P9vqUd+FGPfbQ9l/r
ndcLPROZz4/7Hp3R8++nRJRU65ZU8gxeNrkjOS8NeYVs2Def36ry9X/HLky5ka/bBgEmWLH7JwlS
d9q6tmhtlbUeUbXIMLhayLFAV4ZJ6jgCCgEWa1Bvu4eh3B9OUNr4pmbuglY6gQL/nk02uR3VtyZ1
5Pyefgqkl9M3bzJPAvspvOGs0qAxZC0k1GntQmQkBg==
=mphy
-----END PGP SIGNATURE-----

--Scpk3SAl3oj2hcLchcXspItyFiWaZIboV--


--===============3308694526895900265==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k

--===============3308694526895900265==--

